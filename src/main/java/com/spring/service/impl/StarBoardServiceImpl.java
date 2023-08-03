package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.StarBoardVO;
import com.spring.mapper.StarBoardMapper;
import com.spring.service.StarBoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class StarBoardServiceImpl implements StarBoardService{

	private final StarBoardMapper mapper; 
	
	@Override
	public int setStarBoard() {
		return mapper.insertStarBoard();
	}

	@Override
	public List<StarBoardVO> getStarBoards() {
		return mapper.selectStarBoards();
	}

	@Override
	public int removeAllBoard() {
		return mapper.deleteAllBoard();
	}

	@Override
	public void removeStarBoardById(String user_id) {
		mapper.deleteStarBoardById(user_id);
	}

}
