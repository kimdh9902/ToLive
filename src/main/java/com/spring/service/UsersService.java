package com.spring.service;

import java.util.List;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;
import com.spring.object.PageMaker;

public interface UsersService {
	public int registerAccount(UsersVO vo);
	public UsersVO checkAccount(UsersVO vo);
	public boolean isIdCheck(String id);
	public UsersVO findById(String id);
	public GradeVO getAccountAuthorities(String id);
	
	public List<UsersVO> getAllUsers(PageMaker pageMaker);
	
	public int removeUsersAccount(String id);
	public int registerUsersGradeZero(String id);
	public int getCountUser();
	
	
}
