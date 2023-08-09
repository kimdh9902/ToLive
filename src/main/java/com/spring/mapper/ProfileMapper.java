package com.spring.mapper;

import java.util.List;

import com.spring.domain.ProfileVO;
import com.spring.domain.UsersVO;

public interface ProfileMapper {
	public void insertProfile(UsersVO user);
	
	public ProfileVO selectProfile(String user_id);
	public List<ProfileVO> selectFriend(String user_id);
	
	public void updateProfile(String img, String contents);
	public void updateOndo(ProfileVO vo);

	public void deleteProfile(String user_id);
}
