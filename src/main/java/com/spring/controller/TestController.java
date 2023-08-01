package com.spring.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/test/*")
public class TestController {
	@GetMapping("")
	public String test() {
		return "temptest";
	}
	
	@GetMapping("temp")
	public String test0(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		if(session != null) {
			SecurityContext context = (SecurityContext)session.getAttribute("SPRING_SECURITY_CONTEXT");
			System.out.println("SecurityContext : "+context);
		}
		return "temp";
	}
	
	@GetMapping("detail")
	public String test2() {
		return "detail2";
	}
	
	@GetMapping("admin")
	public String test3() {
		return "admin";
	}
}
