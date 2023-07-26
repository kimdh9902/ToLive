package com.spring.mapper;

import com.spring.domain.UsersVO;

public interface UsersMapper {
	public int insertAccount(UsersVO vo);
	public UsersVO selectAccount(UsersVO vo);
	public int selectByIdCount(String id);
}
