package com.spring.service;

import com.spring.domain.UsersVO;

public interface UsersService {
	public int registerAccount(UsersVO vo);
	public UsersVO checkAccount(UsersVO vo);
}
