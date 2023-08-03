package com.spring.service;

import java.util.List;

import com.spring.domain.FollowVO;

public interface FollowService {
	public List<String> getfollowerNameList(String user_id);
	public List<String> getFollowingNameList(String user_id);
	public int getFollowerCount(String user_id);
	public int getFollowingCount(String user_id);
	
//	public int insertFollow(String user_id, String follower_id);
	public int follow(FollowVO vo);
	public int unFollow(FollowVO vo);
	
	public boolean isFollow(FollowVO vo);

	public void removeFollowById(String user_id);
}
