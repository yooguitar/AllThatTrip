package com.kh.AllThatTrip.camp.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.vo.Camp;

public interface CampService {

	void insertCamp(Camp camp, MultipartFile upfile);
	
	Map<String,Object> selectCampList();
	
	Map<String,Object> selectCampById(Long campNo);
	
	void updateCamp(Camp camp, MultipartFile upfile);
	
	void deleteCamp(Camp camp, String check);
	
}
