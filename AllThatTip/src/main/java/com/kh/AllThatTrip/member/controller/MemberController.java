package com.kh.AllThatTrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.member.model.service.MemberService;
import com.kh.AllThatTrip.member.model.vo.BusinessUser;
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
		return mv.setViewNameAndData("member/join_success_page", null);
	}
	// 사업자 회원가입 핸들러
	@PostMapping("biz-join.me")
	public void bizJoin(Member member, BusinessUser bUser, HttpSession session) {
		if(bUser.getOriginName() != null) {
			Member result = memberService.bizJoin(member);
			Long userNum = result.getUserNo();
			bUser.setUserNo(userNum);
			memberService.bizFile(bUser);
		} else {
			// 예외클래스 만들기
		}
		
		
	}
	
	
	
	
	
	
	
	
	
	/* ajax */
	
	@ResponseBody
	@GetMapping("idcheck")
	public int checkId(String userId) {
		return memberService.checkId(userId);
	}
	
	
	
	/* 포워딩 */
	
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
	@GetMapping("attHome.me")
	public String attHome() {
		return "common/main";
	}
	@GetMapping("bizJoinPage.me")
	public String bizJoinPage() {
		return "member/biz_join_page";
	}
	
	
	
	
	
	
}
