package com.spring.mapper;

import com.spring.domain.HashVO;
import com.spring.domain.UsersHashVO;
import com.spring.domain.UsersVO;

public interface UserHashMapper {
	public UsersVO selectAllHashById(String user_id);
	public int insertHash(UsersHashVO hash);
}
