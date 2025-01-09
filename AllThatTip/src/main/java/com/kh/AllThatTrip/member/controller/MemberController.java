package com.kh.AllThatTrip.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.AllThatTrip.camp.model.vo.Room;
import com.kh.AllThatTrip.common.ModelAndViewUtil;
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

	@PostMapping("login.me")
	public String login(Member member, HttpSession session){
		memberService.countCheck(member);
		Member loginMember = memberService.login(member);

		/**
		 * 이 코드가 여기 있게 된 이유
		 * 페이지 설계 시 로그인 실패는 오류페이지 이동이 아닌 alert만 띄우고 싶었음
		 * 만들다 보니 예상보다 케이스가 많이 발생하여 코드가 길어짐
		 * + 마지막쯤 발생한 로그인 관련 오류 수정은 귀찮아서 오류페이지로 가게 했음
		 */
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
			memberService.rollbackCount(member);
			session.removeAttribute("cartResult");
			session.setAttribute("loginUser", loginMember);
			session.setAttribute("alertMsg", "로그인 성공");  
			return "redirect:/";
		}
	}
	// 회원가입
	@PostMapping("join.me")
	public ModelAndView join(Member member, HttpSession session) {
		memberService.join(member);
		return mv.setViewNameAndData("member/join_success_page", null);
	}
	// 정보수정
	@PostMapping("memberUpdate.me")
	public ModelAndView memberUpdate(Member member, HttpSession session) {
		memberService.memberUpdate(member, session);
		session.setAttribute("alertMsg", "정보수정 성공");
		return mv.setViewNameAndData("member/my_page", null);
	}
	// 회원탈퇴
	@PostMapping("memberDelete.me")
	public ModelAndView memberDelete(String userPwd, HttpSession session) {
		memberService.memberDelete(userPwd, session);
		return mv.setViewNameAndData("common/main", null);
	}
	// ID 찾기
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
	// PW 찾기
	@PostMapping("findPwd.me")
	public String findPwd(Member member, HttpSession session) {
		memberService.findPwd(member);
		session.setAttribute("successAlert", member);
		return "redirect:loginPage.me";
	}
	// 예약찾기 페이지
	@GetMapping("findRsvPage.me")
	public String findRsvPage(HttpSession session) {
		Member loginUser = (Member)session.getAttribute("loginUser");
		memberService.findRsv(loginUser, session);
		return "member/find_rsv_page";
	}
	// 장바구니 조회
	@GetMapping("cartPage.me")
	public String cartPage(HttpSession session) {
		memberService.findCart(session);
		return "member/cart_page";
	}
	// 장바구니 추가
	@PostMapping("cartPage.me")
	public String cartPage(HttpSession session, Room room) {
		memberService.findRoom(room, session);
		return "member/cart_page";
	}
	// 찜 목록(미구현)
	@GetMapping("wishlistPage.me")
	public String wishlistPage(HttpSession session) {
		return"member/wishlist_page";
	}
	// AJAX 아이디 중복검사
	@ResponseBody
	@GetMapping("idcheck")
	public int checkId(String userId) {
		return memberService.checkId(userId);
	}
	
	/* 여기부터는 forward 처리용 */
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