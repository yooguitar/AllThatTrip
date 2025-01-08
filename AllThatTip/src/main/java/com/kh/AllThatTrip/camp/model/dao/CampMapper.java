package com.kh.AllThatTrip.camp.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.camp.model.vo.BizMember;
import com.kh.AllThatTrip.camp.model.vo.Camp;
import com.kh.AllThatTrip.member.model.vo.Member;

@Mapper
public interface CampMapper {
	
	int insertCamp(Camp camp);
	
	List<Camp> selectCampList();
	
	List<Camp> selectCampListByBizNo(Long bizNo);
	
	Camp selectCampById(Long campNo);
	
	int updateCamp(Camp camp);
	
	int deleteCamp(Camp camp);
	
	BizMember bizLogin(Member member);

	List<Camp> recentList();
	
}
