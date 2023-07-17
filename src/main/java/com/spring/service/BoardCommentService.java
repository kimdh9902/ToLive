package com.spring.service;

import java.util.List;

import com.spring.domain.BoardCommentVO;

public interface BoardCommentService {
	public int addComment(BoardCommentVO vo);
	public List<BoardCommentVO> getComments(int b_no);
}
