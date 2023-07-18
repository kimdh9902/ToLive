package com.spring.mapper;

import java.util.List;

import com.spring.domain.HashVO;

public interface HashMapper {

	// 해쉬태그 전체 출력
	public List<HashVO> selectHashList();

	// 해쉬코드 아이디로 해쉬코드 조회
	HashVO selectHash(int hash_id);

	// 해쉬태그 아이디, 해쉬태그명 삽입(추가)
	int insertHash(String hash_tag);

	// 해쉬태그 수정(사용자)
	int updateHashTag(String hash_tag);

	// 해쉬코드 아이디로 해쉬코드 삭제
	int deleteHash(int hash_id);

}
