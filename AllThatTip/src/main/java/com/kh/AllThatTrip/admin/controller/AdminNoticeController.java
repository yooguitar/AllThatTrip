package com.kh.AllThatTrip.admin.controller;

import java.util.Map;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Component
@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminNoticeController {
	
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("AdNotices")
	public ModelAndView selectAdNoticeList(@RequestParam(value="page", defaultValue="1")int page) {
		Map<String, Object> map = adService.selectAdNoticeList(page);
		return mv.setViewNameAndData("AdNotice/list", map);
	}

	
}