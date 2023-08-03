package com.spring.service;

import com.spring.domain.EmojiVO;

public interface EmojiService {
	public Integer getEmoji(EmojiVO vo);
	public void addEmoji(EmojiVO vo);
	public void alterEmoji(EmojiVO vo);
	public void removeEmoji(String user_id);
}