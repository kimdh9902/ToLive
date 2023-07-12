package com.spring.service;

import java.util.List;

import com.spring.domain.StarBoardVO;

public interface StarBoardService {
	public int setStarBoard();
	public List<StarBoardVO> getStarBoards();
	public int removeAllBoard();
}
