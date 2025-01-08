package com.kh.AllThatTrip.member.model.service;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

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
		return mapper.countCheck(member);
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
	public void findCart(Member member, HttpSession session) {
		session.removeAttribute("findCartResult");
//		ArrayList result = mapper.findCart(member);
//		if(!result.isEmpty()) {
//			session.setAttribute("findCartResult", result);
//		}
	}




	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
