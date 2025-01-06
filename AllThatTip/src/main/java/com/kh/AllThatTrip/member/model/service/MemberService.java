package com.kh.AllThatTrip.member.model.service;

import javax.servlet.http.HttpSession;

import com.kh.AllThatTrip.member.model.vo.Member;

public interface MemberService {
	
	Member login(Member member);
	
	int join(Member member);
	
	int checkId(String userId);
	
	void memberUpdate(Member member, HttpSession session);
	
	void memberDelete(String userPwd, HttpSession session);
	
	String findId(String userName);
	
	void findPwd(Member member);

}
