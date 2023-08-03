package com.spring.mapper;

import java.util.List;

import com.spring.domain.BlackListVO;

public interface BlackListMapper {
	// 블랙리스트 전체 출력
	public List<BlackListVO> selectAllBlackList(String user_id);

	// 사용자를 차단하면 블랙리스트에 추가 user_id 가 block_account 를 차단했다고 기록
	public void insertBlackList(String user_id, String block_account);

	// 블랙리스트에서 삭제
	public void deleteBlackList(String user_id, String block_account);
	// 차단한 사용자의글은 보이지 않음
	public void deleteBlackListById(String user_id);
}