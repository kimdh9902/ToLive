package com.spring.service;

import com.spring.domain.BoardHashVO;

public interface BoardHashService {
	
		// 여행후기글 해쉬태그 등록(사용자)
		int registerBoardHash(BoardHashVO vo);
		
		//글 쓰고 default 해쉬 추가해주기
		public int registerDefaultHash(int b_no);

		// 여행후기글 해쉬태그 수정
		int modifyBoardHash(BoardHashVO vo);

		// 여행 후기글 해쉬태그 삭제
		int removeBoardHash(int b_h_no);
		
}
