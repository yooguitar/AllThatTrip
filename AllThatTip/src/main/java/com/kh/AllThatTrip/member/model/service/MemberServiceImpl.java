package com.kh.AllThatTrip.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.exception.LoginCountOverException;
import com.kh.AllThatTrip.exception.LoginFailedException;
import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
	/**
	 * Service
	 * 비즈니스 로직을 최대한 몰아와서 Controller와 역할 분리 노력 했습니다.
	 */
	private final MemberMapper mapper;
	private final PasswordEncryptor passwordEncoder;
	private final MemberValidator validator;
	
	@Override
	public Member login(Member member) {
		return mapper.login(member);
	}
	@Override
	public int join(Member member) {
		validator.validateJoinMember(member);
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		return mapper.join(member);
	}
	@Override
	public int checkId(String userId) {
		return mapper.checkId(userId); 
	}
	/**
	 * memberUpdate
	 * 1. email도 수정할 경우 "@"가 빠져있다면 다시 입력하도록 안내 -> validateMail
	 * 2. 이미 로그인 된 상태에서 변경하는 것이기 때문에 추가 검증은 생략
	 *    사용자가 입력한 암호만 인코딩(암호화)하여 객체에 담아 UPDATE 수행
	 * 3. 로그인 세션이 자동으로 최신화 될 수 있도록 업데이트된 정보로 로그인 하는 요청을 setAttribute
	 */
	@Override
	public void memberUpdate(Member member, HttpSession session) {
		validator.validateMail(member);
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		mapper.memberUpdate(member);
		session.setAttribute("loginUser", mapper.login(member));
	}
	/**
	 * memberDelete
	 * 해야 할 일 = 사용자입력값(평문)과 기존암호(암호문)이 인코딩 했을 때 일치하는지 검사
	 * 1. 로그온 상태의 세션에서 현재 사용자의 정보 받아옴
	 * 2. 사용자 정보로 login쿼리를 조회하면 회원ID만 일치하는지 보기때문에 무조건 결과가 돌아옴
	 * 3. userInfo(암호문)과 userPwd(평문)을 matches
	 * 	  결과가 true라면 userInfo의 userId와 일치하는 행 탈퇴처리(상태'N')   
	 */
	@Override
	public void memberDelete(String userPwd, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		Member userInfo = mapper.login(loginUser);
		if(!(passwordEncoder.matches(userPwd, userInfo.getUserPwd()))) {
			throw new LoginFailedException("입력 정보를 확인해주세요.");
		}
		mapper.memberDelete(userInfo);
		session.setAttribute("deleteSuccess", userInfo);
		session.removeAttribute("loginUser");
	}
	@Override
	public String findId(String userName) {
		return mapper.findId(userName);
	}
	@Override
	public void findPwd(Member member) {
		validator.validateMail(member);
		Member result = mapper.findPwd(member);
		if(result == null) { 
			throw new LoginFailedException("입력 정보를 확인해주세요."); 
			} else { 
				result.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
				mapper.memberUpdate(result);
			}
	}
	@Override
	public void increaseLoginCount(Member member) {
		mapper.increaseLoginCount(member);
	}
	@Override
	public void rollbackCount(Member member) {
		mapper.rollbackCount(member);
	}
	/**
	 * countCheck()
	 * 로그인 시도 시 가장 먼저 호출되는 메소드로
	 * 1. 없는 id로 로그인 시도 시 예외 페이지로
	 * 2. Member VO의 loginCount 필드값을 조회. 5회 실패한다면
	 * 	  loginFullCount 메소드 호출 => 멤버 상태 'N'이 되며 관리자만 풀 수 있음 
	 */
	@Override
	public void countCheck(Member member) {
		Member result = mapper.countCheck(member);
		if(result == null) { 
			throw new LoginFailedException("없는 ID입니다."); 
		} else if(result.getLoginCount() > 4) {
			loginFullCount(result);
			throw new LoginCountOverException("로그인 시도 횟수 초과입니다. 관리자에게 문의 하세요.");
		}
	}
	@Override
	public void loginFullCount(Member member) {
		mapper.loginFullCount(member);
	}
	/* 찜, 예약, 장바구니 관련 */
	@Override
	public void findRsv(Member member, HttpSession session) {
		session.removeAttribute("findRsvResult");
		ArrayList result = mapper.findRsv(member);	
		if(!result.isEmpty()) {
			session.setAttribute("findRsvResult", result);
		}
	}
	@Override
	public void findCart(HttpSession session) {
		if(session.getAttribute("loginUser") == null) { mapper.deleteCart(); }
		ArrayList cartResult = mapper.findCart();
		log.info("카트조회결과{}", cartResult);
		session.setAttribute("cartResult", cartResult);
	}
	@Override
	public void findRoom(Room room, HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			mapper.deleteCart();
		}
		HashMap roomResult = mapper.findRoom(room);
		mapper.saveCart(roomResult);
		ArrayList cartResult = mapper.findCart();
		session.setAttribute("cartResult", cartResult);
	}
}
