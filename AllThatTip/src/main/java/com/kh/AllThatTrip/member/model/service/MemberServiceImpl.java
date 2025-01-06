package com.kh.AllThatTrip.member.model.service;


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
		/*
		 * ** 로그인 시도 횟수제한 아이디어 (미구현)
		 * int count = member.getLoginCount;
		 * 조건문으로 count가 5 이상일 경우 초기화 하고 예외처리 
		 * (조회가 행 단위로 수행되므로 로그인을 시도한 각 ID에 카운트 적립 but 로그인 성공인 경우 또한 카운트가 됨)
		 * member.setLoginCount() = count;
		 * count++
		 * 서비스 갔다오기
		 */
		return mapper.login(member);
	}
	
	@Override
	public int join(Member member) {
		log.info("입력정보:{}", member);
		Member userInfo = mapper.login(member);
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
		validator.validateLength(member);
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
		if(userInfo == null) {
			throw new LoginFailedException("입력 정보를 확인해주세요.");
		}
		mapper.memberDelete(userInfo);
	}

	@Override
	public String findId(String userName) {
		return mapper.findId(userName);
	}

	@Override
	public void findPwd(Member member) {
//		validator.validateLength(member);
		validator.validateMail(member);
		Member result = mapper.findPwd(member);
		if(result == null) { 
			throw new LoginFailedException("입력 정보를 확인해주세요."); 
			} else { 
				result.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
				mapper.memberUpdate(result);
			}
	}
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
