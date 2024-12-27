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
	private final PasswordEncryptor passwordEncoder;
	
	@Override
	public Member login(Member member) {
		Member loginMember = mapper.login(member);
		return loginMember;
	}

	@Override
	public int join(Member member) {
		return mapper.join(member);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
