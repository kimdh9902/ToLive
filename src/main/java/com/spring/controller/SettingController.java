package com.spring.controller;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.UsersVO;
import com.spring.object.CustomUserDetails;
import com.spring.service.FollowService;
import com.spring.service.InfluencerService;

import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/settings/*")
public class SettingController {
	
	private final FollowService followService;
	private final InfluencerService influencerService;

	@GetMapping("")
    public String settingMain() {
        
        return "settings_addHash";
    }
	
	@GetMapping("/settings_updateProfile")
    public String settingProfile() {
        
        return "settings_updateProfile";
    }
	
	@GetMapping("/settings_requestInfluencer")
    public String settingInfluencer(Model model, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication.getPrincipal();
        CustomUserDetails userDetails = (CustomUserDetails) principal;
        UsersVO user = userDetails.getUserVO();
		String sess_id = user.getId();
		System.out.println(sess_id);
		int howFoll = followService.getFollowerCount(sess_id);
		System.out.println("#######################3");
		System.out.println(followService.getFollowerCount(sess_id));
		System.out.println(howFoll);
		System.out.println("#######################3");
		model.addAttribute("howFoll", howFoll);
        return "settingsRequestInfluencer";
    }

	@GetMapping("/insertInfluencer")
	public String addInfluencer(Model model, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        Object principal = authentication.getPrincipal();
        CustomUserDetails userDetails = (CustomUserDetails) principal;
        UsersVO user = userDetails.getUserVO();
		String user_id = user.getId();
		influencerService.setInfluencer(user_id);
		return "settingsRequestInfluencer";
	}
	
	@GetMapping("/settings_updateGrade")
    public String settingGrade() {
        
        return "settings_updateGrade";
    }
}
