package com.spring.controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;
import com.spring.object.CustomUserDetails;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/main/*")
@RequiredArgsConstructor
public class MainController {
	
	@GetMapping("")
	public String main(HttpSession session, Model model) {
		boolean isAuth = false;
		boolean isAdmin = false;
		String msg = null;
		String path;
		if(session != null) {
		    SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		    System.out.println("SecurityContext : "+ securityContext);
		    if(securityContext != null) {
		    	Collection<? extends GrantedAuthority> authorities = securityContext.getAuthentication().getAuthorities();
			    List<GrantedAuthority> gradeVOList = new ArrayList<>(authorities);
			    isAuth = true;
			    String auth = gradeVOList.get(0).getAuthority();
		        if (auth != null || auth != "") {
		        	isAdmin = auth.equals("ROLE_ADMIN") ? true : false;
		        }
		    }
		}
		if(isAuth) {
			if(isAdmin) {
				path = "redirect:/admin/";
			}else {
				path = "redirect:/menu/travBoard";
			}
		}else {
			msg = "You are Not allowed, Plz login!";
			path = "redirect:/auth/login";
		}
		model.addAttribute("msg", msg);
		return path;
	}
	
	@PostMapping("session")
	public String isSession(HttpServletRequest request) {
		HttpSession session = request.getSession(false);
		
		if(session != null)
		{
			return "redirect:/auth/login";
		}
		
		return "showview";
	}
}
