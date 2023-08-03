package com.spring.mapper;

import java.util.List;

import com.spring.domain.StarBoardVO;

public interface StarBoardMapper {
	public int insertStarBoard();
	public List<StarBoardVO> selectStarBoards();
	public int deleteAllBoard();
	public void deleteStarBoardById(String user_id);
}
