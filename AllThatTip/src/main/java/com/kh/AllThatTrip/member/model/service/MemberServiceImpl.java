package com.kh.AllThatTrip.member.model.service;

import org.springframework.stereotype.Service;

import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

	private final MemberMapper mapper;
	private final PasswordEncryptor passwordEncoder;
	
	@Override
	public Member login(Member member) {
		
		Member loginMember = mapper.login(member);
		
		return null;
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
