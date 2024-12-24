package com.kh.AllThatTrip.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member login(Member member);
	
	
	
	
	
	
	
	
	
}
