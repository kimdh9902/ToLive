package com.spring.service;

import com.spring.domain.ProfileVO;

public interface ProfileService {
	public void makeProfile(String user_id);
	public ProfileVO getProfileByID(String user_id);
	public void retouchProfile(String img, String contents);
}
