package com.kh.AllThatTrip.member.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member login(Member member);
	
	Member deletedUser(Member member);
	
	int join(Member member);
	
	int checkId(String userId);
	
	int memberUpdate(Member member);
	
	int memberDelete(Member member);
	
	String findId(String userName);
	
	Member findPwd(Member member);
	
	void increaseLoginCount(Member member);
	
	void rollbackCount(Member member);
	
	Member countCheck(Member member);
	
	/* 찜, 예약, 장바구니 관련 */
	ArrayList findRsv(Member member);
	
}
