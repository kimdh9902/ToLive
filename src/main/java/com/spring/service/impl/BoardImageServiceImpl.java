package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BoardImageVO;
import com.spring.mapper.BoardImageMapper;
import com.spring.service.BoardImageService;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class BoardImageServiceImpl implements BoardImageService {
	
	private final BoardImageMapper mapper;

	@Override
	public List<BoardImageVO> getImages(int b_no) {
		return mapper.selectImages(b_no);
	}

}
