package com.kh.AllThatTrip.camp.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.camp.model.service.CampService;
import com.kh.AllThatTrip.camp.model.vo.BizMember;
import com.kh.AllThatTrip.camp.model.vo.Camp;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("camps")
@RequiredArgsConstructor
public class CampController {
	
	private final CampService campService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("bizLogin")
	public String forwardBizLogin() {
		return "camp/biz_login";
	}
	
	@GetMapping("biz")
	public String forwardBizPage() {
		return "camp/biz";
	}
	
	@PostMapping("login")
	public ModelAndView bizLogin(Member member, HttpSession session) {
		// log.info("{}", member);
		BizMember loginBiz = campService.bizLogin(member, session);
		session.setAttribute("loginUser", loginBiz);
		return mv.setViewNameAndData("redirect:/", null);
	}

	@GetMapping("list")
	public ModelAndView selectCampList() {
		Map<String, Object> responseData = campService.selectCampList();
		// log.info("campList : {}", responseData);
		return mv.setViewNameAndData("camp/camp_list", responseData);
	}
	
	@GetMapping("biz_list")
	public ModelAndView selectCampListByBizNo(HttpSession session) {
		Map<String, Object> responseData = campService.selectCampListByBizNo(session);
		// log.info("campList : {}", responseData);
		return mv.setViewNameAndData("camp/camp_list", responseData);
	}
	
	@GetMapping("detail")
	public ModelAndView selectCampById(Long campNo) {
		Map<String, Object> responseData = campService.selectCampById(campNo);
		return mv.setViewNameAndData("camp/camp_detail", responseData);
	}
	
	@GetMapping("insert_form")
	public String forwardCampInserForm() {
		return "camp/camp_insert_form";
	}
	
	@PostMapping("insert")
	public ModelAndView insertCamp(Camp camp, MultipartFile upfile, HttpSession session) {
		// log.info("camp : {} / {}", camp, upfile);
		campService.insertCamp(camp, upfile, session);
		return mv.setViewNameAndData("camp/biz", null);
	}
	
	@GetMapping("update_form")
	public ModelAndView forwardCampUpdateForm(Long campNo) {
		// log.info("campNo : {}", campNo);
		Map<String, Object> responseData = campService.selectCampById(campNo);
		return mv.setViewNameAndData("camp/camp_update_form", responseData);
	}
	
	@PostMapping("update")
	public ModelAndView updateCamp(Camp camp, MultipartFile upfile) {
		// log.info("camp : {} / {}", camp, upfile);
		campService.updateCamp(camp, upfile);
		return mv.setViewNameAndData("redirect:/camps/biz_list", null);
	}
	
	@PostMapping("delete")
	public ModelAndView deleteCamp(Camp camp, String check) {
		// log.info("campNo : {} / check : {}", campNo, check);
		campService.deleteCamp(camp, check);
		return mv.setViewNameAndData("redirect:/camps/biz_list", null);
	}
	
	@GetMapping("search")
	public ModelAndView searchCamp(String keyword) {
		// log.info("{}", keyword);
		Map<String, Object> responseData = campService.searchCamp(keyword);
		return mv.setViewNameAndData("camp/camp_search_list", responseData);
	}

}
