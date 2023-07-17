package com.spring.mapper;

import org.apache.ibatis.annotations.Param;

public interface EmojiMapper {
	public int insertEmoji(@Param("id") String id, @Param("b_no") int b_no, @Param("emoji_record") String emoji_record);
	public int deleteEmoji(String id, int b_no, String emoji_record);
	
}
