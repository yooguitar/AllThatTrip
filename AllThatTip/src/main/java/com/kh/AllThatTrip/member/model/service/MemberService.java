package com.kh.AllThatTrip.member.model.service;


import com.kh.AllThatTrip.member.model.vo.BusinessUser;
import com.kh.AllThatTrip.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);
	
	int join(Member member);
	
	Member bizJoin(Member member);
	void bizFile(BusinessUser bUser);
	
	int checkId(String userId);
	
	
	
	
	
	

}
