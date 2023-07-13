package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.HashVO;
import com.spring.mapper.HashMapper;
import com.spring.service.HashService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class HashServiceImpl implements HashService {

	private final HashMapper mapper;

	@Override
	public List<HashVO> getHashList() {
		return mapper.selectHashList();
	}

	@Override
	public HashVO getHash(int hash_id) {
		return mapper.selectHash(hash_id);
	}

	@Override
	public int registerHash(String hash_tag) {
		return mapper.insertHash(hash_tag);
	}

	@Override
	public int modifyHashTag(String hash_tag) {
		return mapper.updateHashTag(hash_tag);
	}

	@Override
	public int removeHash(int hash_id) {
		return mapper.deleteHash(hash_id);
	}

}
