package com.spring.service;

import com.spring.domain.NoticeVO;

public interface NoticeService {
	public int addNotice(NoticeVO vo);
	public NoticeVO getNotice();
	public int removeNotice();
}
