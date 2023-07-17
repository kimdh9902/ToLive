package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardCommentVO;
import com.spring.service.BoardCommentService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/boardComment/*")
public class BoardCommentController {
	private final BoardCommentService commentService;
	
	@GetMapping("/insert-comment")
	public void InsertComment(BoardCommentVO vo) {
		commentService.addComment(vo);
	}
	
	@GetMapping("/select-comments")
	public List<BoardCommentVO> SelectComments(int b_no){
		return commentService.getComments(b_no);
	}
}
