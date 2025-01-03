package com.kh.AllThatTrip.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.common.ModelAndViewUtil;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@PostMapping("adLogin.me")
	  public ModelAndView login(Admin admin, HttpSession session, ModelAndView mv) {
	     Admin loginAdmin = adService.login(admin);
	     session.setAttribute("loginAdmin", loginAdmin); 
         session.setAttribute("alertMsg", "로그인에 성공했습니다.!");
         mv.setViewName("redirect:/");
	     return mv;

	}
}
