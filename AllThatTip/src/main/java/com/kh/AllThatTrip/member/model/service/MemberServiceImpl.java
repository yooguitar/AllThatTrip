package com.kh.AllThatTrip.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.exception.UserIdNotFoundException;
import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberMapper mapper;
	// 로그인 회원가입 체크 후 암호화 하기
	
	@Override
	public Member login(Member member) {
		
		Member loginMember = mapper.login(member);
		
		if(loginMember == null) {
			throw new UserIdNotFoundException("존재하지 않는 아이디 입니다.");
		}
		
		return loginMember;
	}

	@Override
	public void join(Member member) {
		
		int userInfo = mapper.join(member);
		log.info("트랜잭션 발생?{}", userInfo);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
