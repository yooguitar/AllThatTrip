package com.kh.AllThatTrip.admin.model.service;

import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.admin.model.vo.AdNotice;

public interface AdService {
	
	Map<String, Object> selectAdNoticeList(int currentPage);
	
	void insertAdNotice(AdNotice adNotice, MultipartFile upfile);


}
