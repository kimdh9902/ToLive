package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.TravBoardVO;

public interface TravBoardService {
	
		// 여행 후기글 삽입
		public int registerTravBoard(@Param("title") String title, @Param("contents") String contents,@Param("user_id") String user_id);
		
		// 여행 후기글 전체 출력(해쉬태그 x)
		public List<TravBoardVO> getTravBoardList();

		// 글 상세조회
		public TravBoardVO getBoard(int trav_b_no);

		// 여행 후기글 수정(본인이 쓴 여행 후기글)
		int modifyTravBoard(TravBoardVO vo);

		// 여행 후기글 숨기기(해쉬태그 x)
		int modifyTravBoardByIsHidden(int trav_b_no);

		// 여행 후기글 공개로 전환(해쉬태그 x)
		int modifyTravBoardToPublic(int trav_b_no);

		// 조회수 증가
		int modifyTravBoardPlusView(int trav_b_no);

		// 여행 후기글 삭제
		public boolean removeTravBoard(int trav_b_no);

// -------------------------------- 프로필 ----------------------------------

		// 프로필(사용자 아이디로 조회)
		public List<TravBoardVO> getAllBoard(String user_id);
}
