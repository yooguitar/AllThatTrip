package com.kh.AllThatTrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
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
	
	// 로그인 핸들러
	@PostMapping("login.me")
	public String login(Member member, HttpSession session) {
		Member loginMember = memberService.login(member);
		
		if(loginMember != null) {
			session.setAttribute("loginUser", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");
			return "redirect:/";
		} else {
			int loginValue = 1;
			session.setAttribute("loginValue", loginValue);
			return "member/login_page";
		}
	}
	// 회원가입 핸들러
	@PostMapping("join.me")
	public ModelAndView join(Member member, HttpSession session) {
		memberService.join(member);
		session.setAttribute("alertMsg", "가입성공");
		return mv.setViewNameAndData("redirect:/", null);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 로그인 페이지 포워딩
	@GetMapping("loginPage.me")
	public String loginPage() {
		return "member/login_page";
	}
	// 회원가입 페이지 포워딩
	@GetMapping("joinPage.me")
	public String joinPage() {
		return "member/join_page";
	}
	// 로그아웃 핸들러
	@GetMapping("logout.me")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "common/main";
	}
	
	
	
	
	
	
	
	
	
}
