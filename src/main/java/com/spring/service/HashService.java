package com.spring.service;

import java.util.List;

import com.spring.domain.HashVO;

public interface HashService {

	// 해쉬태그 전체 출력
	public List<HashVO> getHashList();

	// 해쉬코드 아이디로 해쉬코드 조회
	HashVO getHash(int hash_id);

	// 해쉬태그명 삽입(추가)
	int registerHash(String hash_tag);

	// 해쉬태그 수정(사용자)
	int modifyHashTag(String hash_tag);

	// 해쉬코드 아이디로 해쉬코드 삭제
	int removeHash(int hash_id);

}
