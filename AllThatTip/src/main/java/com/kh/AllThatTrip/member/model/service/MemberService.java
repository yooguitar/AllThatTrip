package com.kh.AllThatTrip.member.model.service;


import com.kh.AllThatTrip.member.model.vo.BusinessUser;
import com.kh.AllThatTrip.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);
	
	int join(Member member);
	
	
	int checkId(String userId);
	
	
	
	
	
	

}
