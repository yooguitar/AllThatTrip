package com.kh.AllThatTrip.member.model.service;

import org.springframework.stereotype.Component;

import com.kh.AllThatTrip.exception.InValidLengthException;
import com.kh.AllThatTrip.exception.InvalidDomainTypeException;
import com.kh.AllThatTrip.exception.InvalidInputValueException;
import com.kh.AllThatTrip.exception.UserFoundException;
import com.kh.AllThatTrip.member.model.dao.MemberMapper;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class MemberValidator {
	
	private final MemberMapper mapper;

	/**
	 * 회원가입 시 수행되는 유효성 검증 메소드
	 * 1. 삭제된 멤버인 검사하는 이유? 
	 * => 상태가 'N'으로 변경 된 ID로 새로 회원가입을 하게되면 회원가입이 그대로 진행됨('N'상태 ID는 검사대상 아님) 
	 * 	  그렇게 되면 각자 상태가 'Y','N'으로 동일한 ID가 존재하게 된다. UNIQUE 제약조건 위배
	 * 2. 1을 통과 했을 경우 중복검사
	 * 3. 앞의 조건을 모두 통과 했을 경우 정규표현식을 통해 조건에 맞지 않은 값 모두 필터링
	 */
	public void validateJoinMember(Member member) {
		validateDeletedMember(member);
		validateDuplicateMember(member);
		validateInputValue(member);
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
	
	public void validateInputValue(Member member) {
		if(
		member.getUserId().contains("admin") ||
		member.getUserId().matches("[a-zA-Z0-9]{6,20}") != true ||
		member.getUserPwd().matches("[a-zA-Z0-9]{6,20}") != true ||
		member.getUserName().matches("[a-zA-Z0-9가-힣]{2,30}") != true ||
		member.getEmail().matches("^[a-zA-Z0-9]+@[a-zA-Z0-9]+\\.[a-z]+$") != true ||
		member.getPhone().matches("[0-9]{11}") != true
		) {
			throw new InvalidInputValueException("입력 정보를 확인해주세요.");
		}
			
	}

	public void validateMail(Member member) {
		if(!member.getEmail().contains("@")) {
			throw new InvalidDomainTypeException("이메일 입력 형식을 확인해주세요");
		}
	}
	
	

}
