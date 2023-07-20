package com.spring.mapper;

import com.spring.domain.EmojiVO;

public interface EmojiMapper {
	public Integer selectEmoji(EmojiVO vo);
	public void insertEmoji(EmojiVO vo);
	public void updateEmoji(EmojiVO vo);
}