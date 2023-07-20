package com.spring.service;

import java.util.List;

import com.spring.domain.TravBoardVO;

public interface TravBoardService {

	// 여행 후기글 전체 출력(해쉬태그 x)
	public List<TravBoardVO> getTravBoardList(String user_id);

	// 글 상세조회
	public TravBoardVO getBoard(int trav_b_no);

	// 조회수 증가
	int modifyTravBoardPlusView(int trav_b_no);
	
	//글 삭제
	boolean removeTravBoard(int trav_b_no);

// -------------------------------- 프로필 ----------------------------------

	// 프로필(사용자 아이디로 조회)
	public List<TravBoardVO> getAllBoard(String user_id);
}
