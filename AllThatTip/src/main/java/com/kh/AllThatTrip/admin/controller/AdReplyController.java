package com.kh.AllThatTrip.admin.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.AdReply;
import com.kh.AllThatTrip.common.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("ad_reply")
public class AdReplyController {
	private final AdService adService;
	
	@PostMapping
	public ResponseEntity<ResponseData> ajaxInsertReply(AdReply adReply) {
		
		int result = adService.insertAdReply(adReply);
		ResponseData response = ResponseData.builder()
											.message("댓글 등록에 성공띠")
											.status(HttpStatus.OK.toString())
											.data(result)
											.build();
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}	
	@GetMapping(produces="application/json; charset=UTF-8") //JSON [{replyNo : 1, replyWriter : 'admin'...}....]
	public ResponseEntity<ResponseData> ajaxSelectReply(int adNoticeNo){
		List<AdReply> replies = adService.selectAdReplyList(adNoticeNo);
		ResponseData response = ResponseData.builder()
											.message("댓글 조회에 성공띠")
											.status(HttpStatus.OK.toString())
											.data(replies)
											.build();
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}	
	
}
