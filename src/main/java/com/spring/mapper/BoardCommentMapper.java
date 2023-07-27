package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardCommentVO;

public interface BoardCommentMapper {
	public int insertComment(BoardCommentVO boardCommentVO);
	public void deleteComment(int c_no);
	public int updateComment(BoardCommentVO vo);
	public List<BoardCommentVO> selectComments(int b_no);
}
