package com.kh.AllThatTrip.member.model.service;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.exception.LoginFailedException;
import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {
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

	@Override
	public void memberUpdate(Member member, HttpSession session) {
//		validator.validateLength(member);
		validator.validateMail(member);
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		mapper.memberUpdate(member);
		session.setAttribute("loginUser", mapper.login(member));
	}

	@Override
	public void memberDelete(String userPwd, HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		loginUser.setUserPwd(userPwd);
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
	
	@Override
	public Member countCheck(Member member) {
		
		Member result = mapper.countCheck(member);
		
		if(result == null) {
			throw new LoginFailedException("없는 ID입니다.");
		}
		
		return result;
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
	
	// CART GET요청 시
	@Override
	public void findCart(HttpSession session) {
		if(session.getAttribute("loginUser") == null) {
			// 로그인 되어있지 않다면 장바구니 초기화
			mapper.deleteCart();
		}
		ArrayList cartResult = mapper.findCart();
		log.info("카트조회결과{}", cartResult);
		session.setAttribute("cartResult", cartResult);
	}
	
	// CART POST 요청 시 (장바구니 등록 경우)
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
