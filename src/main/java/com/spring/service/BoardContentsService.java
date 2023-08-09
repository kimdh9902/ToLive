package com.spring.service;

import java.util.List;

import com.spring.domain.BoardContentsVO;

public interface BoardContentsService {

	int insertBoardContents( String contents, String type, int contents_no );
	
	BoardContentsVO selectBoardContents( int b_no );
	
	boolean isContents(int b_no);

	boolean deleteBoardContents( int b_no );
	
}
