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
	public void addBlackList(String user_id, String block_account) {
		mapper.insertBlackList(user_id, block_account);
	}

	@Override
	public List<BlackListVO> getBlackList(String user_id) {
		return mapper.selectAllBlackList(user_id);
	}

	@Override
	public void removeBlackList(String user_id, String block_account) {
		mapper.deleteBlackList(user_id, block_account);
	}

	@Override
	public void removeBlackListById(String user_id) {
		mapper.deleteBlackListById(user_id);
	}

}
