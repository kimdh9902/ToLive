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
	public int addComment(BoardCommentVO boardCommentVO) {
		return mapper.insertComment(boardCommentVO);
	}

	@Override
	public List<BoardCommentVO> getComments(int b_no) {
		return mapper.selectComments(b_no);
	}

	@Override
	public void removeComment(int c_no) {
		mapper.deleteComment(c_no);
	}

	@Override
	public int alterComment(BoardCommentVO vo) {
		return mapper.updateComment(vo);
	}

	@Override
	public void removeUsersComment(String user_id) {
		mapper.deleteUsersComment(user_id);
	}

}
