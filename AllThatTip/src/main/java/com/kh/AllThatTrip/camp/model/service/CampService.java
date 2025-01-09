package com.kh.AllThatTrip.camp.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.camp.model.vo.BizMember;
import com.kh.AllThatTrip.camp.model.vo.Camp;
import com.kh.AllThatTrip.member.model.vo.Member;

public interface CampService {
	
	BizMember bizLogin(Member member, HttpSession session);

	void insertCamp(Camp camp, MultipartFile upfile, HttpSession session);
	
	Map<String,Object> selectCampList();
	
	Map<String,Object> selectCampListByBizNo(HttpSession session);
	
	Map<String,Object> selectCampById(Long campNo);
	
	void updateCamp(Camp camp, MultipartFile upfile);
	
	void deleteCamp(Camp camp, String check);
	
	List<Camp> recentList();

	Map<String, Object> searchCamp(String keyword);

	Map<String, Object> searchCampsByAddr(String addr, int page);
	
}
