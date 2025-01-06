package com.kh.AllThatTrip.camp.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kh.AllThatTrip.camp.model.vo.Camp;

@Mapper
public interface CampMapper {
	
	int insertCamp(Camp camp);
	
	List<Camp> selectCampList();
	
	Camp selectCampById(Long campNo);
	
	int updateCamp(Camp camp);
	
	int deleteCamp(Camp camp);
	
}
