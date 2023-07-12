package com.spring.mapper;

import com.spring.domain.ProfileVO;

public interface ProfileMapper {
	public void insertProfile(String user_id);
	public ProfileVO selectProfile(String user_id);
	public void updateProfile(String img, String contents);
}