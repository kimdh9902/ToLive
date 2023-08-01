package com.spring.service;

import java.util.List;

import com.spring.domain.InfluencerVO;

public interface InfluencerService {
	public int setInfluencer(String user_id);
	public List<InfluencerVO> getInfluencer();
	public int alterInfluencer(String user_id);
	public int removeInfluencer(String user_id);
}
