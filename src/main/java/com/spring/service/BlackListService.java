package com.spring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.BlackListVO;

public interface BlackListService {
	//추가
	public void addBlackList(String user_id, String block_account);
	//출력
	public List<BlackListVO> getBlackList(String user_id);
	//삭제
	public void removeBlackList(String user_id, String block_account);

	public void removeBlackListById(String user_id);
}
