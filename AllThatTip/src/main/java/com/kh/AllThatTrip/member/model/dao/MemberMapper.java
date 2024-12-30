package com.kh.AllThatTrip.member.model.dao;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.member.model.vo.BusinessUser;
import com.kh.AllThatTrip.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member login(Member member);
	
	int join(Member member);
	
	//Member join(Member member);
	
	Member bizJoin(Member member);
	
	int checkId(String userId);
	
	
	
}
