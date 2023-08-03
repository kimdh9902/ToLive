package com.spring.service;

import java.util.List;

import com.spring.domain.BoardImageVO;

public interface BoardImageService {
	public List<BoardImageVO> getImages(int b_no);// 이미지 리스트 출력
}
