package com.spring.mapper;

import com.spring.domain.BoardVO;

public interface BoardMapper {

	//글 삽입
	public int insertBoard(BoardVO vo);
	
	//여행 후기글 삽입(팀장)
	public int insertToTrav(BoardVO vo);
	
	//글 수정(본인이 쓴 글)
	int updateBoard(BoardVO vo);
	
	//글 숨기기
	int updateBoardByIsHidden(int b_no);
	
	//글 공개로 전환
	int updateBoardToPublic(int b_no);
	
	//글 삭제
	public boolean deleteBoard(int b_no);

		
}
