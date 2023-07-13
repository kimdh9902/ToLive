package com.spring.controller;

import java.util.List;

import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.AlarmVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;
import com.spring.service.AlarmService;
import com.spring.service.ProfileService;
import com.spring.service.SearchService;

import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/menu/*")
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
	
	@GetMapping("/findUser")
	public String search(Model model) {
	
		return "findUser";
	}
	
	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<String> searchUser(Model model, @RequestBody Htt request) {
		log.info("user------"+request.);
		
		List<SearchIdVO> list = searchService.findByIdAndName(user);
		System.out.println("list:" + list);
		
		Gson gson = new Gson(); // Gson 라이브러리를 이용해 JSON 형태로 변환
	    String jsonList = gson.toJson(list);
		
		return new ResponseEntity<String>(jsonList, HttpStatus.OK);
	}
	
	@GetMapping("/alarm")
	public List<AlarmVO> alarm(Model model, String id) {
		List<AlarmVO> alarmList = alaramService.getAlarmByUser(id);
		return alarmList;
	}
	
	@GetMapping("/starBoard")
	public String starBoard() {
		return "starBoard";
	}
}
