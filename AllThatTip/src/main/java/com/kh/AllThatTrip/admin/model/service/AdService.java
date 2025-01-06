package com.kh.AllThatTrip.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.kh.AllThatTrip.admin.model.vo.AdNotice;
import com.kh.AllThatTrip.admin.model.vo.AdReply;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.member.model.vo.Member;

public interface AdService {
	
	Map<String, Object> selectAdNoticeList(int currentPage);
	
	void insertAdNotice(AdNotice adNotice, MultipartFile upfile);

	Map<String, Object> selectById(Long id);
	
	void updateAdNotice(AdNotice adNotice, MultipartFile upfile);
	
	void deleteAdNotice(Long adNoticeNo, String adChaName);

	Admin adLogin(Admin admin);

	int insertAdReply(AdReply adReply);

	List<AdReply> selectAdReplyList(int adNoticeNo);

}
