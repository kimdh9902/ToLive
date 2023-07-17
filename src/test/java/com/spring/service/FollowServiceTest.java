package com.spring.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.FollowVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FollowServiceTest {
	
	@Setter (onMethod_ = @Autowired)
	private FollowService service;
	
	@Test
	public void test() {
//		int follower = mapper.selectFollowerCount("celeb01");
////		FollowVO vo = new FollowVO();
////		vo.setFollower_id("user01");
////		vo.setUser_id("celeb01");
////		mapper.insertFollow(vo);
//		int following = mapper.selectFollowingCount("celeb01");
//		List<String> folN =  mapper.selectFollower("user01");
////		
//		assertNotNull(follower);
//		assertNotNull(following);
//		assertNotNull(folN);
////		
//		log.info("flw------"+follower);
//		log.info("flwn------"+following);
//		log.info("flL--------"+folN);
		List<String> list = service.getfollowerNameList("user01");
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
	}

}