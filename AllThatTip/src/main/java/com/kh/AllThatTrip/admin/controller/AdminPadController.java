package com.kh.AllThatTrip.admin.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.exception.LoginFailedException;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/adPad")
public class AdminPadController {
	
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("controller")
	public ModelAndView setPadView(ModelAndView mv) {
		mv.setViewName("admin/admin_pad");
		return mv;
	}
	
	
	
	
	
}
