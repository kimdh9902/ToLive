package com.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.service.BoardService;
import com.spring.service.StarBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/board/*")
public class BoardController {
	
	private final StarBoardService starService;
	
	@GetMapping("/star-set")
	public void StarBoardSet() {
		starService.setStarBoard();
	}
	
	@GetMapping("/star-remove")
	public void StarBoardRemove() {
		starService.removeAllBoard();
	}
}
