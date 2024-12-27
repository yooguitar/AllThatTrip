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
	
	@PostMapping("login.me")
	public String login(Member member, HttpSession session) {
		Member loginMember = memberService.login(member);
		
		if(loginMember != null) {
			session.setAttribute("loginUser", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");
			return "redirect:/";
		} else {
			int loginValue = 0;
			session.setAttribute("loginValue", loginValue);
			return "member/login_page";
		}
		
	}
	
	@PostMapping("join.me")
	public ModelAndView join(Member member) {
		memberService.join(member);
		return null;
	}
	@GetMapping("loginPage.me")
	public String loginPage() {
		return "member/login_page";
		
	}
	@GetMapping("joinPage.me")
	public String joinPage() {
		return "member/join_page";
	}
	
	@GetMapping("logout.me")
	public String logout(HttpSession session) {
		session.removeAttribute("loginUser");
		return "common/main";
	}
	
	
	
	
	
	
	
	
	
}
