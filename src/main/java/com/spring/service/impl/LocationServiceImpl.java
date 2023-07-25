package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.LocationVO;
import com.spring.mapper.LocationMapper;
import com.spring.service.LocationService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LocationServiceImpl implements LocationService{
	
	private final LocationMapper mapper;
	
	@Override
	public List<LocationVO> selectLocationById(LocationVO vo) {
		return mapper.selectLocationById(vo);
	}

}
