package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardContentsVO;
import com.spring.mapper.BoardContentsMapper;
import com.spring.service.BoardContentsService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardContentsServiceImpl implements BoardContentsService {

	private final BoardContentsMapper mapper;
	
	@Override
	public int insertBoardContents(String contents, String type, int contents_no) {
		int result = mapper.insertBoardContents(contents,type,contents_no);
		return result;
	}

	@Override
	public BoardContentsVO selectBoardContents(int b_no) {
		BoardContentsVO vo = mapper.selectBoardContents(b_no);
		return vo;
	}

	@Override
	public boolean deleteBoardContents(int b_no) {
		boolean result = mapper.deleteBoardContents(b_no);
		return result;
	}

	@Override
	public boolean isContents(int b_no) {
		boolean result = false;
		if(mapper.selectCount(b_no) > 0) {
			result = true;
		}
		return result;
	}

}
