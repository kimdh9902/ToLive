package com.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.spring.domain.GradeVO;

import com.spring.domain.UsersVO;
import com.spring.object.PageMaker;

public interface UsersMapper {
	public int insertAccount(UsersVO vo);
	public UsersVO selectAccount(UsersVO vo);
	public int selectByIdCount(String id);
	
	public UsersVO selectAccountById(String id);
	public GradeVO selectGradeById(String id);
	
//	public List<UsersVO> selectAllUsers(PageMaker pageMaker);
	List<UsersVO> selectAllUsers(@Param("offset") int offset, @Param("limit") int limit);
	public int deleteUsersAccount(String id);
	public int updateUsersGradeZero(String id);
	public int selectCountUser();

}
