package com.spring.service;

import com.spring.domain.BoardImageVO;
import com.spring.domain.BoardVO;

public interface BoardService {

	// 글 삽입
	public int registerBoard(BoardVO vo);

	// 이미지 삽입
	public int plusImage(BoardImageVO vo);

	// 여행 후기글 삽입
	public int registerToTrav(BoardVO vo);

	// 글 수정(본인이 쓴 글)
	int modifyBoard(BoardVO vo);

	// 글 숨기기
	int modifyBoardByIsHidden(int b_no);

	// 글 공개로 전환
	int modifyBoardToPublic(int b_no);

	// 글 삭제
	public boolean removeBoard(int b_no);

	public void removeBoardById(String user_id);

}
