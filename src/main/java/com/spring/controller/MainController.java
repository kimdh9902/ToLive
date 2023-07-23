package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/*")
@RequiredArgsConstructor
public class MainController {
	
	@GetMapping("")
	public String main(HttpSession session) {
		boolean isAuth = false;
		String path;
		if(session != null) {
			Object auth = session.getAttribute("SESS_AUTH");
	        if (auth != null) {
	            isAuth = (boolean) auth;
	        }
		}
		if(isAuth) {	
			path = "redirect:/menu/travBoard"; 
		}else {
			path = "redirect:/auth/login?msg=You are Not allowed, Plz login!";
		}
		return path;
	}

}
