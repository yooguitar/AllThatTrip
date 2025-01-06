package com.kh.AllThatTrip.member.model.service;

import javax.servlet.http.HttpSession;

import com.kh.AllThatTrip.member.model.vo.Member;

public interface MemberService {
	
	/* 멤바 관련 */
	Member login(Member member);
	
	int join(Member member);
	
	int checkId(String userId);
	
	void memberUpdate(Member member, HttpSession session);
	
	void memberDelete(String userPwd, HttpSession session);
	
	String findId(String userName);
	
	void findPwd(Member member);
	
	/* 예약, 찜, 장바구니 관련 */
	void findRsv(Member member);
	
	
}
