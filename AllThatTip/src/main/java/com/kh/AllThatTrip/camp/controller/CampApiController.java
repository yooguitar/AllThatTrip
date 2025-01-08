package com.kh.AllThatTrip.camp.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.AllThatTrip.camp.model.service.CampService;
import com.kh.AllThatTrip.camp.model.vo.Camp;
import com.kh.AllThatTrip.common.model.vo.ResponseData;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RestController
@RequestMapping("campsAjax")
@RequiredArgsConstructor
public class CampApiController {
	
	private final CampService campService;
	
	@GetMapping("recentList")
	public ResponseEntity<ResponseData> ajaxRecentList(){
		List<Camp> list = campService.recentList();
		ResponseData response = ResponseData.builder()
											.message("캠핑장 조회에 성공했습니다.")
											.status(HttpStatus.OK.toString())
											.data(list)
											.build();
		return new ResponseEntity<ResponseData>(response, HttpStatus.OK);
	}

}
