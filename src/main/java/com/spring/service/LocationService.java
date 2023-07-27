package com.spring.service;

import java.util.List;

import com.spring.domain.LocationVO;

public interface LocationService {
	public List<LocationVO> selectLocationById(LocationVO vo);
}
