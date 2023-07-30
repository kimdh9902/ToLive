package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.spring.domain.LocationVO;
import com.spring.domain.UsersVO;
import com.spring.service.LocationService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@RequestMapping("/auth")
@Log4j
@RequiredArgsConstructor
public class AuthController {

// 계정 연동 및 통합 관리
	private final UsersService service;
	private final LocationService locService;
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@GetMapping("/login-success")
	public String loginTry(HttpSession session) {
		System.out.println("Login Post!!!!!");
		/*UsersVO user = new UsersVO();
		user.setId(userId);
		user.setPw(userPw);
		String path;
		UsersVO resultVO = service.checkAccount(user);
		if(resultVO != null) {
			session.setAttribute("SESS_ID", resultVO.getId());
			session.setAttribute("SESS_AUTH", true);
			session.setAttribute("SESS_NAME", resultVO.getName());
			session.setAttribute("SESS_GRADE", resultVO.getGrade_level());
//			session.
			if (user.getGrade_level() != 7) {
				System.out.println(user.getGrade_level());
				path = "redirect:/main/";
			} else {
				path = "redirect:/admin/report"; //관리자
			}
			
		}else {
			path = "redirect:/users/login?msg=fail, retry";
		}*/
		return "home";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("before"+session);
		
	    if (session != null) {
	        session.invalidate();
	        SecurityContextHolder.getContext().setAuthentication(null);
	    }
	    
		System.out.println("after"+session);
		
		return "redirect:login?msg=logout success";
	}

	@GetMapping("/register")
	public String register() {
		
		return "register";
	}
	
	// rest로 바꾸고 회원가입 성공시 true  true가 아니면 페이지 넘기지 말기
	@ResponseBody
	@PostMapping(value = "/register", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean register(@RequestBody UsersVO vo) {
		log.info(vo);
		int result = service.registerAccount(vo);
		if(result > 0) {
			return true;
		}
		
		return false;
	}
	
	@ResponseBody
	@PostMapping(value = "/location", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<LocationVO> locationCode(@RequestBody LocationVO loc){
		List<LocationVO> list = locService.selectLocationById(loc);
		System.out.println("list:" + list);
		return list;
	}
	
	@ResponseBody
	@PostMapping(value = "/idcheck", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean register(@RequestBody Map<String, String> map) {
		
		String id = map.get("id");
		System.out.println("id : " + id + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		// 실패작이래~
//		JsonParser parser = new JsonParser();
//		System.out.println(parser.parse(id));;
//		JsonObject json = new JsonObject(id, JsonObject.class);
//		json.addProperty("id", id);
//		System.out.println("json"+ json);
//		Gson gson = new Gson();
//		gson.fromJson(json, String.class);
//		System.out.println("gson : " + gson + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		boolean result = service.isIdCheck(id);
		if(result) {
			return true;
		}
		
		return false;
	}
}
