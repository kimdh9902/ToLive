package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.EmojiVO;
import com.spring.mapper.EmojiMapper;
import com.spring.service.EmojiService;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class EmojiServiceImpl implements EmojiService{
	
	private final EmojiMapper mapper;
	@Override
	public void addEmoji(EmojiVO vo) {
		mapper.insertEmoji(vo);
	}

	@Override
	public void alterEmoji(EmojiVO vo) {
		mapper.updateEmoji(vo);
	}

}
