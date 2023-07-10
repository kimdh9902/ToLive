package com.spring.mapper;

public interface EmojiMapper {
	public void insertEmoji(String id, int b_no, String emoji_record);
	public void deleteEmoji(String id, int b_no, String emoji_record);
	public void updateEmoji(int i, int b_no);
}
