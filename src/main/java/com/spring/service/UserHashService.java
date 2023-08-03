package com.spring.service;

import com.spring.domain.UsersHashVO;
import com.spring.domain.UsersVO;

public interface UserHashService {
	public UsersVO getAllHashById(String user_id);
	public int insertHashs(UsersHashVO hash);
}
