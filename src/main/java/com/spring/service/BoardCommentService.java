package com.spring.service;

import java.util.List;

import com.spring.domain.BoardCommentVO;

public interface BoardCommentService {
	public int addComment(BoardCommentVO boardCommentVO);
	public void removeComment(int c_no);
	public int alterComment(BoardCommentVO vo);
	public List<BoardCommentVO> getComments(int b_no);
	public void removeUsersComment(String user_id);
}