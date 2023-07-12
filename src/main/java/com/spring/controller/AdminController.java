package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.StarBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AdminController {
	
	private final StarBoardService starService;
	
	@GetMapping("/star-set")
	public String StarBoardSet() {
		starService.setStarBoard();
		return null;
	}
	
	@GetMapping("/star-remove")
	public String StarBoardRemove() {
		starService.removeAllBoard();
		return null;
	}
	
}
