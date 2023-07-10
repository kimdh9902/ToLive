package com.spring.mapper;

import java.util.List;

public interface SearchMapper {
	public List<SearchIdVO> selectId(String name);
}
