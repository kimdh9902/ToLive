package com.spring.service;

import java.util.List;

import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;

public interface SearchService {
	public List<SearchIdVO> findByIdAndName(String name);
	public List<ProfileVO> getFriendRecommend(String user_id);
}
