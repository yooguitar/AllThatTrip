package com.kh.AllThatTrip.member.model.service;


import org.springframework.stereotype.Service;

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
////		String originPass = member.getUserPwd();
////		member.setUserPwd(passwordEncoder.encode(originPass));
//		log.info("서비스가 받은 정보{}", member);
//		
//		Member loginMember = mapper.login(member);
////		if(!(passwordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd()))) {
////			loginMember = null; 
////			}
//		log.info("DB조회 결과{}", loginMember);
//		
//		
//		
//		if(loginMember == null) {
//			System.out.println("null 반환");
//			int loginValue = 1;
//			session.setAttribute("loginValue", loginValue);
//			return "member/login_page";
//		}
//		
//		boolean result = passwordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd());
//		log.info("매치결과{}", result);
//		if(result == false) {
//			int loginValue = 1;
//			session.setAttribute("loginValue", loginValue);
//			return "member/login_page";
//		}
//		session.setAttribute("loginUser", loginMember);
//		session.setAttribute("alertMsg", "로그인 성공");
//		return "redirect:/";
		
		/*--------------------------------------------------------------------*/
		
//		Member loginMember = mapper.login(member);
//		
//		if(loginMember == null) {
//			System.out.println("null 반환");
//			int loginValue = 1;
//			session.setAttribute("loginValue", loginValue);
//			return "redirect:/";
//		}
//		
//		return null;
		
		return mapper.login(member);
		
	}

	@Override
	public int join(Member member) {
		Member userInfo = mapper.login(member);
		validator.validateJoinMember(member);
		member.setUserPwd(passwordEncoder.encode(member.getUserPwd()));
		return mapper.join(member);
	}

	@Override
	public int checkId(String userId) {
		return mapper.checkId(userId); 
	}
	



	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
