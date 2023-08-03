package com.spring.mapper;

import java.util.List;

import com.spring.domain.InfluencerVO;

public interface InfluencerMapper {
	public int insertInfluencer(String user_id);
	public List<InfluencerVO> selectAllInfluencer();
	public int checkRequestInfluencer();
	public int updateInfluencer(String user_id);
	public int deleteInfluencer(String user_id);
}
