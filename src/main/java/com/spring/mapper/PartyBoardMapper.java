package com.spring.mapper;

import java.util.List;

import com.spring.domain.PartyBoardVO;

public interface PartyBoardMapper {

	// 파티 모집 게시판 등록
	int insertPartyBoard(PartyBoardVO vo);

	// 파티 모집 게시판 글 전체 출력-> dummy data 전체 출력
	public List<PartyBoardVO> selectPartyBoardList();

	// 파티 모집 게시판 글 상세조회
	PartyBoardVO selectOnePartyBoard(int party_b_no);

	// 파티 모집 게시판 글 조회(사용자 아이디)
	public List<PartyBoardVO> selectPartyBoardById(String user_id);

	// 파티 모집 게시판 글 수정(본인에 한하여 최대 인원 사이즈 조정)
	int updatePartyBoard(PartyBoardVO vo);

	// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
	int updatePartyBoardPlusMember(int party_b_no);

	// 파티 모집 게시판 글 삭제
	boolean deletePartyBoard(int b_no);

	// 파티 모집 게시판 글 삭제(모집 인원 충족 시)
	int deletePartyBoardWhenRecruitComplete(PartyBoardVO vo);
	
	public void deletePartyBoardById(String user_id);
}
