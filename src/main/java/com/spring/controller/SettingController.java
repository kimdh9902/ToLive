package com.spring.controller;

import java.util.Collections;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.BoardVO;
import com.spring.domain.FollowVO;
import com.spring.domain.GradeVO;
import com.spring.domain.PartyBoardVO;
import com.spring.domain.UsersVO;
import com.spring.object.CustomUserDetails;
import com.spring.service.FollowService;
import com.spring.service.GradeService;
import com.spring.service.InfluencerService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/settings/*")
public class SettingController {

	private final FollowService followService;
	private final InfluencerService influencerService;
	private final UsersService usersService;

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

	// 공개범위 변경 페이지로 이동
	@GetMapping("/settings_updateGrade")
	public String settingGrade(Model model) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Object principal = authentication.getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails) principal;
		UsersVO user = userDetails.getUserVO();
		model.addAttribute("UsersVO", user);

		String user_id = user.getId();
		String user_name = user.getName();
		int grade_level = user.getGrade_level();

		GradeVO gvo = usersService.getAccountAuthorities(user_id);
		model.addAttribute("GradeVO", gvo);

		return "settings_updateGrade";
	}

	// 권한 레벨 변경
	@RequestMapping(value = "/settings_changeGrade", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String updateGradeLevel(UsersVO vo, HttpSession session) {
		String user_id = null;
		SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		CustomUserDetails userDetails = (CustomUserDetails) securityContext.getAuthentication().getPrincipal();
		UsersVO user = userDetails.getUserVO();
		user_id = user.getId();
		vo.setId(user_id);

		int changeUserGradelevel = usersService.changeUserGrade(vo);

		if (changeUserGradelevel > 0) {
			return "redirect:settings_updateGrade";
		} else {
			return null;
		}
	}

}
