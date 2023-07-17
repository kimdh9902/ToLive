package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardCommentVO;
import com.spring.mapper.BoardCommentMapper;
import com.spring.service.BoardCommentService;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class BoardCommentServiceImpl implements BoardCommentService{
	
	private final BoardCommentMapper mapper;
	
	@Override
	public int addComment(BoardCommentVO vo) {
		return mapper.insertComment(vo);
	}

	@Override
	public List<BoardCommentVO> getComments(int b_no) {
		return mapper.selectComments(b_no);
	}

}
