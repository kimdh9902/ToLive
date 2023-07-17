package com.spring.service;

import org.apache.ibatis.annotations.Param;

public interface EmojiService {
	//추가
	public int addEmoji(@Param("id") String id, @Param("b_no") int b_no, @Param("emoji_record") String emoji_record);
	//삭제
	public int removeEmoji(String id, int b_no, String emoji_record);
}
