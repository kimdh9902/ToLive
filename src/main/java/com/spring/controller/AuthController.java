package com.spring.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.UsersVO;
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
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	@PostMapping("/login")
	public String loginTry(String userId, String userPw, HttpSession session) {
		UsersVO user = new UsersVO();
		user.setId(userId);
		user.setPw(userPw);
		String path;
		UsersVO resultVO = service.checkAccount(user);
		if(resultVO != null) {
			session.setAttribute("SESS_ID", resultVO.getId());
			session.setAttribute("SESS_AUTH", true);
			session.setAttribute("SESS_NAME", resultVO.getName());
			session.setAttribute("SESS_GRADE", resultVO.getGrade_level());
			if (user.getGrade_level() != 7) {
				System.out.println(user.getGrade_level());
				path = "redirect:/main/";
			} else {
				path = "redirect:/admin/report"; //관리자
			}
			
		}else {
			path = "redirect:/users/login?msg=fail, retry";
		}
		return path;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		System.out.println("before"+session);
		
	    if (session != null) {
	        session.invalidate();
	    }
	    
		System.out.println("after"+session);
		
		return "redirect:login?msg=logout success";
	}
	/*
	 * UsersVO user = new UsersVO();
		String id = request.getParameter("userId");
		String pw = request.getParameter("userPw");// SHAEncodeUtil.encodeSha(request.getParameter("pw"))
		user.setId(id);
		user.setPw(SHAEncodeUtil.encodeSha(pw));

		user = service.getAccount(id, pw);
		if (user != null) {
			HttpSession session = request.getSession(false);
			session.setAttribute("SESS_ID", id);
			session.setAttribute("SESS_AUTH", true);
			session.setAttribute("SESS_NAME", user.getName());
			session.setAttribute("SESS_GRADE", user.getGrade_level());
			if (user.getGrade_level() != 7) {
				System.out.println(user.getGrade_level());
				response.sendRedirect(request.getContextPath() + "/main");
			} else {
				response.sendRedirect(request.getContextPath() + "/report");
			}
		} else {
			String msg = "fail, retry";
			response.sendRedirect(request.getContextPath() +"/view/login.jsp?msg=" + msg);
		}
	 */
	@GetMapping("/register")
	public String register() {
		
		return "register";
	}
	
	// rest로 바꾸고 회원가입 성공시 true  true가 아니면 페이지 넘기지 말기
	@PostMapping("/register")
	public String register(UsersVO vo) {
		log.info(vo);
		int result = 0;
//		service.registerAccount(vo);
//		if(result == 0) {
//			return ""
//		}
		
		return "login";
	}
}
