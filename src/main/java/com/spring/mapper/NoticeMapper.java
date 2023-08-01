package com.spring.mapper;

import com.spring.domain.NoticeVO;

public interface NoticeMapper {
	public int insertNotice(NoticeVO vo);
	public NoticeVO selectNotice();
	public int deleteNotice();
	
}
