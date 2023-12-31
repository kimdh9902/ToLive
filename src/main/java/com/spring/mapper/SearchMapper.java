package com.spring.mapper;

import java.util.List;

import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;

public interface SearchMapper {
	public List<SearchIdVO> selectId(String name);
	public List<ProfileVO> selectFriendRecommend(String user_id);
}
