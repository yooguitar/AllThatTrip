package com.kh.AllThatTrip.member.model.dao;

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
	
}
