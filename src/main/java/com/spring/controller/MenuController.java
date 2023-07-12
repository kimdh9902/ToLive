package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;
import com.spring.service.AlarmService;
import com.spring.service.ProfileService;
import com.spring.service.SearchService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/menu")
public class MenuController {
	private final ProfileService profileService;
	private final SearchService searchService;
	private final AlarmService alaramService;
	
	@GetMapping("/profile")
	public String profile(Model model, String user_id) {
		ProfileVO profileVO = profileService.getProfileByID(user_id);
		System.out.println(profileVO.getFollower());
		/* request.setAttribute("profileVO", profileVO); */
		model.addAttribute("name", profileVO.getUser_name());
		model.addAttribute("id", profileVO.getUser_id());
		model.addAttribute("follower", profileVO.getFollower());
		model.addAttribute("follwing", profileVO.getFollowing());
		model.addAttribute("boardCount", profileVO.getBoard_count());
		return "profile";
	}
	
	@GetMapping("/search")
	public String search(Model model) {
	
		return "findUser";
	}
	
	@PostMapping("/search")
	@ResponseBody
	public List<SearchIdVO> searchUser(Model model, String user) {
		System.out.println(user);
		
		List<SearchIdVO> list = searchService.findByIdAndName(user);
		System.out.println("list:" + list);
		
//		Gson gson = new Gson(); // Gson 라이브러리를 이용해 JSON 형태로 변환
//	    String jsonList = gson.toJson(list);
	    
		return list;
	}
	
	@GetMapping("/alarm")
	public String alarm(Model model) {
	
		return "alarm";
	}
}
