package com.spring.service;

import java.util.List;

import com.spring.domain.FollowVO;

public interface FollowService {
	public List<String> followerNameList(String user_id);
	public int getFollowerCount(String user_id);
	public int getFollowingCount(String user_id);
	
//	public int insertFollow(String user_id, String follower_id);
	public int follow(FollowVO vo);
	public int UnFollow(String user_id, String follower_id);
}
