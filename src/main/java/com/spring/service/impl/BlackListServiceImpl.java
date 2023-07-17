package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.BlackListVO;
import com.spring.mapper.BlackListMapper;
import com.spring.service.BlackListService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BlackListServiceImpl implements BlackListService{

	private final BlackListMapper mapper;
	
	@Override
	public int addBlackList(String user_id, String block_account) {
		return mapper.insertBlackList(user_id, block_account);
	}

	@Override
	public List<BlackListVO> getBlackList(String user_id) {
		return mapper.selectAllBlackList(user_id);
	}

	@Override
	public int removelackList(String user_id, String block_account) {
		return mapper.deleteBlackList(user_id, block_account);
	}

}
