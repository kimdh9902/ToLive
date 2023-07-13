package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardHashVO;
import com.spring.mapper.BoardHashMapper;
import com.spring.service.BoardHashService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardHashServiceImpl implements BoardHashService {

	private final BoardHashMapper mapper;

	@Override
	public int registerBoardHash(BoardHashVO vo) {
		return mapper.insertBoardHash(vo);
	}

	@Override
	public int registerDefaultHash(int b_no) {
		return mapper.insertDefaultHash(b_no);
	}

	@Override
	public int modifyBoardHash(BoardHashVO vo) {
		return mapper.updateBoardHash(vo);
	}

	@Override
	public int removeBoardHash(int b_h_no) {
		return mapper.deleteBoardHash(b_h_no);
	}

}
