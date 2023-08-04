package com.spring.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.FollowVO;
import com.spring.domain.FriendRecommendVO;
import com.spring.object.CustomUserDetails;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FollowServiceTest {
	
	@Setter (onMethod_ = @Autowired)
	private FollowService service;
	@Setter (onMethod_ = @Autowired)
	private SearchService searchService;
	
	@Test
	public void test() {
		List<FriendRecommendVO> result = null;
	    result = searchService.getFriendRecommend("qwe");
	    System.out.println(result);
	}

}
