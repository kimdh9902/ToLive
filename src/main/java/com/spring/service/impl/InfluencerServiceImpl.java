package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.InfluencerVO;
import com.spring.mapper.InfluencerMapper;
import com.spring.service.InfluencerService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class InfluencerServiceImpl implements InfluencerService{
	
	private final InfluencerMapper mapper;
	
	@Override
	public int setInfluencer(String user_id) {
		return mapper.insertInfluencer(user_id);
	}

	@Override
	public List<InfluencerVO> getInfluencer() {
		return mapper.selectInfluencer();
	}
	
	@Override
	public int checkApplyInfluencer() {
		return mapper.checkRequestInfluencer();
	}

	@Override
	public int alterInfluencer(String user_id) {
		return mapper.updateInfluencer(user_id);
	}

	@Override
	public int removeInfluencer(String user_id) {	
		return mapper.deleteInfluencer(user_id);
	}

}
