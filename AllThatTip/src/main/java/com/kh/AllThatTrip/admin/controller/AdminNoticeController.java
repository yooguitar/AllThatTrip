package com.kh.AllThatTrip.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.AdNotice;
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
	
	@GetMapping("adNotices")
	public ModelAndView selectAdNoticeList(@RequestParam(value="page", defaultValue="1")int page) {
		Map<String, Object> map = adService.selectAdNoticeList(page);
		return mv.setViewNameAndData("adNotice/list", map);
	}
	
	@GetMapping("insertForm")
	public String insertForm() {
		return "adNotice/insert_form";
	}
	
	@PostMapping("adNotices")                   
	public ModelAndView save(AdNotice adNotice, MultipartFile upfile, HttpSession session) {
		
		adService.insertAdNotice(adNotice, upfile);
		session.setAttribute("alertMsg","게시글 등록에 성공했습니다.");
		return mv.setViewNameAndData("redirect:boards", null);
	}
	
	@GetMapping("adNotices/{id}")
	public ModelAndView selectById(@PathVariable(name="id")Long id) {
		Map<String, Object> responseData = adService.selectById(id);
		return mv.setViewNameAndData("adNotice/detail", responseData);
	}
	
	
	@GetMapping("map")
	public String mapForward() {
		return "common/map";
	}
	
}