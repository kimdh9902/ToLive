package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.SearchIdVO;
import com.spring.mapper.SearchMapper;
import com.spring.service.SearchService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService{

	private final SearchMapper mapper;
	
	@Override
	public List<SearchIdVO> findByIdAndName(String name) {
		return mapper.selectId(name);
	}

}
