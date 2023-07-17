package com.spring.mapper;

import java.util.List;

import com.spring.domain.FollowVO;

public interface FollowMapper {
	public List<String> selectFollower(String user_id);
	public List<String> selectFollowing(String user_id);
	public int selectFollowerCount(String user_id);
	public int selectFollowingCount(String user_id);
	
//	public int insertFollow(String user_id, String follower_id);
	public int insertFollow(FollowVO vo);
	public int deleteUnFollow(FollowVO vo);
	
	public int isFollow(FollowVO vo);
}
