package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.NoticeVO;
import com.spring.mapper.NoticeMapper;
import com.spring.service.NoticeService;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	
	private final NoticeMapper mapper;
	
	@Override
	public int addNotice(NoticeVO vo) {
		return mapper.insertNotice(vo);
	}

	@Override
	public NoticeVO getNotice() {
		return mapper.selectNotice();
	}

	@Override
	public int removeNotice() {
		return mapper.deleteNotice();
	}

}
