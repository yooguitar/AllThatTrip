package com.kh.AllThatTrip.member.model.service;

import org.springframework.stereotype.Component;

import com.kh.AllThatTrip.exception.InValidLengthException;
import com.kh.AllThatTrip.exception.InvalidDomainTypeException;
import com.kh.AllThatTrip.exception.UserFoundException;
import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberValidator {
	
	private final MemberMapper mapper;

	// 정보 검증 메소드
	public void validateJoinMember(Member member) {
		validateDeletedMember(member);
		validateDuplicateMember(member);
		validateLength(member);
		validateMail(member);
	}
	
	public void validateDuplicateMember(Member member) {
		Member exMember = mapper.login(member);
		if(exMember != null && member.getUserId().equals(exMember.getUserId())) {
			throw new UserFoundException("이미 존재하는 회원입니다.");
		}
	}
	
	public void validateDeletedMember(Member member) {
		Member exMember = mapper.deletedUser(member);
		if(exMember != null && member.getUserId().equals(exMember.getUserId())) {
			throw new UserFoundException("이미 존재하는 회원입니다.");
		}
	}
	
	public void validateLength(Member member) {
		if(member.getUserId().length() > 30 || member.getUserId().length() < 6 ||
			member.getUserPwd().length() > 30 || member.getUserPwd().length() < 6 ||
			member.getUserId().contains("admin")) {
			// id 특수문자 입력 처리?
			throw new InValidLengthException("ID / PW 입력을 확인해주세요.");
		} 
	}
	
	public void validateMail(Member member) {
		if(!member.getEmail().contains("@")) {
			throw new InvalidDomainTypeException("이메일 입력 형식을 확인해주세요");
		}
	}
	
	
	
	
	

}
