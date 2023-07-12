package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ProfileVO;
import com.spring.mapper.ProfileMapper;
import com.spring.service.ProfileService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class ProfileServiceImpl implements ProfileService{

	private final ProfileMapper mapper;
	
	@Override
	public void makeProfile(String user_id) {
		mapper.insertProfile(user_id);
	}

	@Override
	public ProfileVO getProfileByID(String user_id) {
		return mapper.selectProfile(user_id);
	}

	@Override
	public void retouchProfile(String img, String contents) {
		mapper.updateProfile(img, contents);
	}

}
