package com.spring.mapper;

import java.util.List;

import com.spring.domain.BoardImageVO;

public interface BoardImageMapper {
	public List<BoardImageVO> selectImages(int b_no);// 이미지 리스트 출력

}
