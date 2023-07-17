package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.mapper.EmojiMapper;
import com.spring.service.EmojiService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmojiServiceImpl implements EmojiService{
	
	private final EmojiMapper mapper;
	
	@Override
	public int addEmoji(String id, int b_no, String emoji_record) {
		return mapper.insertEmoji(id, b_no, emoji_record);
	}

	@Override
	public int removeEmoji(String id, int b_no, String emoji_record) {
		return mapper.deleteEmoji(id, b_no, emoji_record);
	}

}
