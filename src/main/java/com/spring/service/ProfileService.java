package com.spring.service;

import java.util.List;

import com.spring.domain.ProfileVO;

public interface ProfileService {
	public void makeProfile(String user_id);
	
	public ProfileVO getProfileByID(String user_id);
	public List<ProfileVO> getFriends(String user_id);
	
	public void retouchProfile(String img, String contents);
	public void retouchOndo(ProfileVO vo);

	public void removeProfile(String user_id);
}
