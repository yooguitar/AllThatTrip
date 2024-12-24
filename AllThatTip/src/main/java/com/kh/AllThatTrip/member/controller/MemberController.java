package com.kh.AllThatTrip.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.AllThatTrip.member.model.vo.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class MemberController {

	@PostMapping("login.me")
	public void login(Member member) {
		log.info("입력 받은 값? =>", member);
		System.out.println("ㅎㅇㅎㅇ");
	}
	
	
	@GetMapping("abc")
	public void hi() {
		log.info("hi");
	}
	
	  
	
	
	
	
	
	
	
	
	
	
	
	
}
