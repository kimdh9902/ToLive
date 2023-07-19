package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.PartyBoardVO;

public interface PartyBoardService {
	
	// 파티 모집 게시판 등록
	int registerPartyBoard(PartyBoardVO vo);

	// 파티 모집 게시판 글 전체 출력
	public List<PartyBoardVO> getAllPartyBoard();

	// 파티 모집 게시판 글번호로 조회
	PartyBoardVO getPartyBoardByPartyBNo(int party_b_no);

	// 파티 모집 게시판 글 조회(사용자 아이디)
	public List<PartyBoardVO> getPartyBoardById(String user_id);

	// 파티 모집 게시판 글 수정(본인에 한하여 제목,최대 인원 사이즈 조정)
	int modifyPartyBoard(@Param("title") String title, @Param("max_people") int max_people,@Param("party_b_no") int party_b_no);

	// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
	int modifyPartyBoardPlusMember(int party_b_no);

	// 파티 모집 게시판 글 삭제
	int removePartyBoard(int party_b_no);

	// 파티 모집 게시판 글 삭제(모집 인원 충족 시)
	int removePartyBoardWhenRecruitComplete(PartyBoardVO vo);
}
