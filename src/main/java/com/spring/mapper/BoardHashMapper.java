package com.spring.mapper;

import com.spring.domain.BoardHashVO;

public interface BoardHashMapper {

	// 여행후기글 해쉬태그 등록(사용자)
	int insertBoardHash(BoardHashVO vo);
	
	//글 쓰고 default 해쉬 추가해주기
	public int insertDefaultHash(int b_no);
	
	// 여행후기글 해쉬태그 글 번호로 조회
	BoardHashVO selectBoardHashByBNo(int b_no);

	// 여행후기글 해쉬태그 수정
	int updateBoardHash(BoardHashVO vo);

	// 여행 후기글 해쉬태그 삭제
	int deleteBoardHash(int b_h_no);
	

}
