package com.kh.AllThatTrip.admin.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.AdNotice;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminNoticeController {
	
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("admin_notice")
	public ModelAndView selectAdNoticeList(@RequestParam(value="page", defaultValue="1")int page) {
		Map<String, Object> map = adService.selectAdNoticeList(page);
		return mv.setViewNameAndData("admin/admin_notice", map);
	}
	
	@GetMapping("ad_insert_form")
	public String insertForm() {
		return "admin/ad_insert_form";
	}
	
	@PostMapping("admin_notice")                   
	public ModelAndView save(AdNotice adNotice, MultipartFile upfile, HttpSession session) {
		log.info("{}", upfile);
		adService.insertAdNotice(adNotice, upfile);
		session.setAttribute("alertMsg","게시글 등록에 성공했습니다.");
		return mv.setViewNameAndData("redirect:/admin/admin_notice", null);
	}
	
	@GetMapping("admin_notice/{id}")
	public ModelAndView selectById(@PathVariable(name="id")Long id) {
		//log.info("{}", id);
		Map<String, Object> responseData = adService.selectById(id);
		return mv.setViewNameAndData("/admin/detail_adNotice", responseData);
	}
	
	@PostMapping("ad_delete")
	public ModelAndView deleteBoard(Long adNoticeNo, String adChaName) {
		adService.deleteAdNotice(adNoticeNo, adChaName);
		return  mv.setViewNameAndData("redirect:/admin/admin_notice", null);		
	}
	
	@GetMapping("ad_update_form")
	public ModelAndView updateForm(Long adNoticeNo) {
		log.info("{}", adNoticeNo );
		Map<String, Object> responseData = adService.selectById(adNoticeNo);
		return mv.setViewNameAndData("admin/ad_update_form", responseData);
	}
	 
	@PostMapping("1ad_update_form")
	public ModelAndView update(AdNotice adNotice, MultipartFile upfile) {
		adService.updateAdNotice(adNotice, upfile);
		
		return mv.setViewNameAndData("redirect:/admin/admin_notice", null);
	}
	
	@GetMapping("map")
	public String mapForward() {
		return "common/map";
	}
	
}