package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.FollowVO;
import com.spring.mapper.FollowMapper;
import com.spring.service.FollowService;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class FollowServiceImpl implements FollowService{

	private final FollowMapper mapper;

	@Override
	public List<String> getfollowerNameList(String user_id) {
		return mapper.selectFollower(user_id);
	}

	@Override
	public List<String> getFollowingNameList(String user_id) {
		return mapper.selectFollowing(user_id);
	}
	
	@Override
	public int getFollowerCount(String user_id) {
		return mapper.selectFollowingCount(user_id);
	}

	@Override
	public int getFollowingCount(String user_id) {
		return mapper.selectFollowingCount(user_id);
	}

	@Override
	public int follow(FollowVO vo) {
		return mapper.insertFollow(vo);
	}

	@Override
	public int UnFollow(String user_id, String follower_id) {
		return mapper.deleteUnFollow(user_id, follower_id);
	}

}
