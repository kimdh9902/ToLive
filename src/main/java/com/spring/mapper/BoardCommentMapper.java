package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardCommentVO;

public interface BoardCommentMapper {
	public int insertComment(BoardCommentVO vo);
	public List<BoardCommentVO> selectComments(int b_no);
}
