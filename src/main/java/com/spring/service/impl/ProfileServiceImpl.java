package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.ProfileVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.ProfileMapper;
import com.spring.service.ProfileService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class ProfileServiceImpl implements ProfileService{

	private final ProfileMapper mapper;
	
	@Override
	public void makeProfile(UsersVO user) {
		mapper.insertProfile(user);
	}

	@Override
	public ProfileVO getProfileByID(String user_id) {
		return mapper.selectProfile(user_id);
	}

	@Override
	public List<ProfileVO> getFriends(String user_id) {
		return mapper.selectFriend(user_id);
	}
	
	@Override
	public void retouchProfile(String img, String contents) {
		mapper.updateProfile(img, contents);
	}

	@Override
	public void retouchOndo(ProfileVO vo) {
		mapper.updateOndo(vo);
	}
	
	@Override
	public void removeProfile(String user_id) {
		mapper.deleteProfile(user_id);
	}

}
