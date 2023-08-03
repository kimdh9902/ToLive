package com.spring.mapper;

import com.spring.domain.BoardImageVO;
import com.spring.domain.BoardVO;
import com.spring.domain.PartyBoardVO;

public interface BoardMapper {

	// 글 삽입
	public int insertBoard(BoardVO vo);

	// 이미지 삽입
	public int insertImage(BoardImageVO vo);

	// 여행 후기글 삽입
	public int insertToTrav(BoardVO vo);

	// 파티 모집 게시판 삽입
	public int insertToParty(PartyBoardVO pvo);

	// 글 수정(본인이 쓴 글)
	int updateBoard(BoardVO vo);

	// 파티 모집 게시판 수정
	int updatePartyBoard(PartyBoardVO pvo);

	// 글 숨기기
	int updateBoardByIsHidden(int b_no);

	// 글 공개로 전환
	int updateBoardToPublic(int b_no);

	// 글 삭제
	public boolean deleteBoard(int b_no);

}
