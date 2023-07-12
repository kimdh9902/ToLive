package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.TravBoardVO;

public interface TravBoardMapper {

	// 여행 후기글 삽입
	public int insertTravBoard(@Param("title") String title, @Param("contents") String contents,@Param("user_id") String user_id);
	
	// 여행 후기글 전체 출력(해쉬태그 x)
	public List<TravBoardVO> selectTravBoardList();

	// 글 상세조회
	public TravBoardVO selectBoard(int trav_b_no);

	// 여행 후기글 수정(본인이 쓴 여행 후기글)
	int updateTravBoard(TravBoardVO vo);

	// 여행 후기글 숨기기(해쉬태그 x)
	int updateTravBoardByIsHidden(int trav_b_no);

	// 여행 후기글 공개로 전환(해쉬태그 x)
	int updateTravBoardToPublic(int trav_b_no);

	// 조회수 증가
	int updateTravBoardPlusView(int trav_b_no);

	// 여행 후기글 삭제
	public boolean deleteTravBoard(int trav_b_no);

// -------------------------------- 프로필 ----------------------------------

	// 프로필(사용자 아이디로 조회)
	public List<TravBoardVO> selectAllBoard(String user_id);

}
