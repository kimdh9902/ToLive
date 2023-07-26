package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.UsersVO;
import com.spring.mapper.UsersMapper;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService{

	private final UsersMapper mapper;
	
	@Override
	public int registerAccount(UsersVO vo) {
		return mapper.insertAccount(vo);
	}

	@Override
	public UsersVO checkAccount(UsersVO vo) {
		return mapper.selectAccount(vo);
	}

	@Override
	public boolean isIdCheck(String id) {
		int result = mapper.selectByIdCount(id);
		if(result > 0) {
			return true;
		}
		return false;
	}

}
