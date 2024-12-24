package com.kh.AllThatTrip.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberMapper mapper;
	// 로그인 회원가입 체크 후 암호화 하기
	
	@Override
	public Member login(Member member) {
		
		Member loginMember = mapper.login(member);
		
		return null;
	}

	@Override
	public void join(Member member) {
		
		Member userInfo = mapper.login(member);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
