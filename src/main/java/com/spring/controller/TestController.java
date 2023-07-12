package com.spring.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.mapper.FollowMapper;

import lombok.Setter;

@Controller
@RequestMapping("/test/*")
public class TestController {
	@Setter (onMethod_ = @Autowired)
	FollowMapper mapper;
	@GetMapping("/t")
	public String test(Model model) {
		
		model.addAttribute("list", mapper.selectFollower("user01"));
		return "test";
	}
}
