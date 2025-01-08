package com.kh.AllThatTrip.admin.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.admin.model.service.AdService;
import com.kh.AllThatTrip.admin.model.vo.Admin;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.exception.LoginFailedException;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class AdminController {
	private final AdService adService;
	private final ModelAndViewUtil mv;
	
	@GetMapping("adLoginPage.me")
	public String adLoginPage() {
		return "admin/ad_login_page";
		
	}
	
	
	@PostMapping("adLogin.me")
	  public ModelAndView login(Admin admin, HttpSession session, ModelAndView mv) {
		log.info("admin =  {}", admin);
	     Admin loginAdmin = adService.adLogin(admin);
	     log.info("loginAdmin = {}", loginAdmin);
	     if(loginAdmin != null) {
	    	 session.setAttribute("loginAdmin", loginAdmin); 
	    	 session.setAttribute("alertMsg", "로그인에 성공했습니다.!");
	     } else {
	    	 throw new LoginFailedException("로그인 실패");
	     }
         mv.setViewName("redirect:/admin/admin_notice");
	     return mv;

	}
}
