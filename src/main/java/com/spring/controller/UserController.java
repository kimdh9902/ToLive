package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.service.FollowService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RestController
@RequestMapping("/user/*")
@RequiredArgsConstructor
public class UserController {
	
	private final FollowService followService;
	
	@GetMapping(value = "/friend", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<String> friendList(HttpSession session){
		String id = (String)session.getAttribute("SESS_ID");
		List<String> result = followService.getfollowerNameList(id);
		
		
		return result;
	}
}
