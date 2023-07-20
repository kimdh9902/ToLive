package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.TravBoardVO;

public interface TravBoardMapper {

	// 여행 후기글 전체 출력(해쉬태그 x)
	public List<TravBoardVO> selectTravBoardList(String user_id);

	// 글 상세조회
	public TravBoardVO selectOneBoard(int trav_b_no);

	// 조회수 증가
	int updateTravBoardPlusView(int trav_b_no);
	
	//글 삭제
	boolean deleteTravBoard(int trav_b_no);

// -------------------------------- 프로필 ----------------------------------

	// 프로필(사용자 아이디로 조회)
	public List<TravBoardVO> selectAllBoard(String user_id);

}
