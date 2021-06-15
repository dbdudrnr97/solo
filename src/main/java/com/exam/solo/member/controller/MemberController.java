package com.exam.solo.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {

	@GetMapping("/memberLogin.do")
	public void memberLogin() { // 로그인 페이지요청
	}
	
	@GetMapping("/memberJoin.do")
	public String memberJoin() {
		return "/member/memberJoin";
	}
}
