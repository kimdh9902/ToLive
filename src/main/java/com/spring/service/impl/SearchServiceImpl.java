package com.spring.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.ProfileVO;
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
		List<SearchIdVO> result = new ArrayList<SearchIdVO>();
		if(!name.equals(""))
			result = mapper.selectId(name);
		
		return result;
	}

	@Override
	public List<ProfileVO> getFriendRecommend(String user_id) {
		return mapper.selectFriendRecommend(user_id);
	}

}
