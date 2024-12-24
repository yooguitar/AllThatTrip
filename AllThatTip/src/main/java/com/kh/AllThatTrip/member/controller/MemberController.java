package com.kh.AllThatTrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.member.model.service.MemberService;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final ModelAndViewUtil mv;
	
	@PostMapping("login.me")
	public ModelAndView login(Member member, HttpSession session) {
		
		System.out.println("로그인 핸들러 호출");
		System.out.println(member.toString());
		Member loginMember = memberService.login(member);
		
		session.setAttribute("loginUser", loginMember);
		session.setAttribute("alertMsg", "환영합니다!");
		
		System.out.println("포워딩 문제임");
		return mv.setViewNameAndData("redirect:/index.jsp", null); // 메인화면으로 보내야함!
		
	}
	
	@PostMapping("join.me")
	public ModelAndView join(Member member) {
		
		memberService.join(member);
		
		return null;
	}
	
	  
	
	
	
	
	
	
	
	
	
	
	
	
}
