package com.spring.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.FriendRecommendVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;
import com.spring.mapper.SearchMapper;
import com.spring.service.FollowService;
import com.spring.service.SearchService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class SearchServiceImpl implements SearchService{

	private final SearchMapper mapper;
	private final FollowService followService;
	
	@Override
	public List<SearchIdVO> findByIdAndName(String name) {
		List<SearchIdVO> result = new ArrayList<SearchIdVO>();
		if(!name.equals(""))
			result = mapper.selectId(name);
		
		return result;
	}

	@Override
	public List<FriendRecommendVO> getFriendRecommend(String user_id) {
		List<FriendRecommendVO> result = new ArrayList<>();
		List<ProfileVO> profileList = mapper.selectFriendRecommend(user_id);
		
		for(int i = 0; i < profileList.size(); i++) {
			FriendRecommendVO vo = new FriendRecommendVO();
			System.out.println("ID? :" + profileList.get(i).getUser_id());
			vo.setFriend(profileList.get(i));
			vo.setFollowing(followService.getSameFollwing(user_id, profileList.get(i).getUser_id()));
			result.add(vo);
		}

		return result;
	}

}
