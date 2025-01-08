package com.kh.AllThatTrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.common.ModelAndViewUtil;
import com.kh.AllThatTrip.exception.LoginCountOverException;
import com.kh.AllThatTrip.member.model.service.MemberService;
import com.kh.AllThatTrip.member.model.service.PasswordEncryptor;
import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
public class MemberController {

	private final MemberService memberService;
	private final ModelAndViewUtil mv;
	private final PasswordEncryptor passwordEncoder;
	
	// 로그인 핸들러
	@PostMapping("login.me")
	public String login(Member member, HttpSession session){		
			Member countMember = memberService.countCheck(member);
		if(countMember.getLoginCount() > 4) {
			memberService.rollbackCount(member);
			throw new LoginCountOverException("로그인 시도 횟수 초과입니다. 로그인 정보를 확인해주세요.");
		}
		Member loginMember = memberService.login(member);
		if(loginMember == null){ 
			memberService.increaseLoginCount(member);
			int loginValue = 1;
			session.setAttribute("loginValue", loginValue);
			return "member/login_page";
		}
		if(!(passwordEncoder.matches(member.getUserPwd(), loginMember.getUserPwd()))) {
			memberService.increaseLoginCount(member);
			int loginValue = 1;
			session.setAttribute("loginValue", loginValue);
			return "member/login_page";
		} else {
			//log.info("조회된 회원 정보 {}", loginMember);
			member.setLoginCount(0);
			memberService.rollbackCount(member);
			session.setAttribute("loginUser", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");  
			return "redirect:/";
		}
	}
	// 회원가입 핸들러
	@PostMapping("join.me")
	public ModelAndView join(Member member, HttpSession session) {
		memberService.join(member);
		return mv.setViewNameAndData("member/join_success_page", null);
	}
	// 회원정보수정 핸들러
	@PostMapping("memberUpdate.me")
	public ModelAndView memberUpdate(Member member, HttpSession session) {
		memberService.memberUpdate(member, session);
		session.setAttribute("alertMsg", "정보수정 성공");
		return mv.setViewNameAndData("member/my_page", null);
	}
	// 회원탈퇴 핸들러
	@PostMapping("memberDelete.me")
	public ModelAndView memberDelete(String userPwd, HttpSession session) {
		memberService.memberDelete(userPwd, session);
		return mv.setViewNameAndData("common/main", null);
	}
	// id찾기 핸들러
	@PostMapping("findId.me")
	public String findId(String userName, HttpSession session) {
		String findUser = memberService.findId(userName);
		if(findUser != null) {
		session.setAttribute("findUser", findUser);
		} else {
			session.setAttribute("findUser", "존재하지 않는 사용자입니다.");
		}
		return "redirect:findIdPage.me";
	}
	// pw찾기 핸들러(pw를 찾아줄 수 없으므로 일치하는 id, phone이 있다면 update 수행)
	@PostMapping("findPwd.me")
	public String findPwd(Member member, HttpSession session) {
		memberService.findPwd(member);
		session.setAttribute("successAlert", member);
		return "redirect:loginPage.me";
	}
	
	
	
	
	/* 예약, 찜, 장바구니 관련 */
	@GetMapping("findRsvPage.me")
	public String findRsvPage(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		memberService.findRsv(loginUser, session);
		return "member/find_rsv_page";
	}
	
	@GetMapping("cartPage.me")
	public String cartPage(HttpSession session) {
		// 비회원
		
		
		
		// 회원
		
		
		
		return "member/cart_page";
	}
	
	@GetMapping("wishlistPage.me")
	public String wishlistPage(HttpSession session) {
		return"member/wishlist_page";
	}
	
	
	
	
	/* ajax */
	@ResponseBody
	@GetMapping("idcheck")
	public int checkId(String userId) {
		return memberService.checkId(userId);
	}
	/* forward */
	@GetMapping("attHome.me")
	public String attHome() {
		return "common/main";
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
	@GetMapping("bizJoinPage.me")
	public String bizJoinPage() {
		return "member/biz_join_page";
	}
	@GetMapping("myPage.me")
	public String myPage() {
		return "member/my_page";
	}
	@GetMapping("updatePage.me")
	public String myPageUpdate() {
		return "member/update_page";
	}
	@GetMapping("deletePage.me")
	public String deletePage() {
		return "member/delete_page";
	}
	@GetMapping("findIdPage.me")
	public String findIdPage() {
		return "member/find_id_page";
	}
	@GetMapping("nonUserFindRsvPage.me")
	public String nonUserFindRsvPage() {
		return "member/non_user_find_rsv_page";
	}
	@GetMapping("findPwdPage.me")
	public String findPwdPage() {
		return "member/find_pwd_page";
	}
	@GetMapping("cancelRsvPage.me")
	public String cancelRsvPage() {
		return "member/cancel_rsv_page";
	}
	@GetMapping("eventListPage.me")
	public String eventListPage() {
		return "member/event_list_page";
	}
}