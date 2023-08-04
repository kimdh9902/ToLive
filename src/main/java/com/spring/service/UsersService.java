package com.spring.service;

import java.util.List;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;

public interface UsersService {
	public int registerAccount(UsersVO vo);
	public UsersVO checkAccount(UsersVO vo);
	public boolean isIdCheck(String id);
	public UsersVO findById(String id);
	public GradeVO getAccountAuthorities(String id);
	
	public List<UsersVO> getAllUsers();	
	
	public int removeUsersAccount(String id);
	public int registerUsersGradeZero(String id);
	
	public int modifyUsersGradeZero(String id);//비매너 등급으로 변경
	
	public int changeUserGrade(UsersVO vo);//공개범위 변경(회원 등급 변경)
	
}
