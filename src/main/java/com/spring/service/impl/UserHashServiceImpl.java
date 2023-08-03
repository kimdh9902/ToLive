package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.UsersHashVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.UserHashMapper;
import com.spring.service.UserHashService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class UserHashServiceImpl implements UserHashService{

	private final UserHashMapper mapper;
	
	@Override
	public UsersVO getAllHashById(String user_id) {
		return mapper.selectAllHashById(user_id);
	}

	@Override
	public int insertHashs(UsersHashVO hash) {
		return mapper.insertHash(hash);
	}

}
