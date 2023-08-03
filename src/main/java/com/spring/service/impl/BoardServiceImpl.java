package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardVO;
import com.spring.mapper.BoardMapper;
import com.spring.service.BoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardServiceImpl implements BoardService {

	private final BoardMapper mapper;

	@Override
	public int registerBoard(BoardVO vo) {
		return mapper.insertBoard(vo);
	}

	@Override
	public int modifyBoard(BoardVO vo) {
		return mapper.updateBoard(vo);
	}

	@Override
	public int modifyBoardByIsHidden(int b_no) {
		return mapper.updateBoardByIsHidden(b_no);
	}

	@Override
	public int modifyBoardToPublic(int b_no) {
		return mapper.updateBoardToPublic(b_no);
	}

	@Override
	public boolean removeBoard(int b_no) {
		return mapper.deleteBoard(b_no);
	}

	@Override
	public void removeBoardById(String user_id) {
		mapper.deleteBoardById(user_id);
	}

}
