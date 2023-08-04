package com.spring.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.mapper.ProfileMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class ProfileTest {
	
	@Autowired
	private ProfileMapper mapper;
	
	@Autowired
	private ProfileService service;
	
	@Test
	public void test() {
//		mapper.selectFriend("qwe");
		System.out.println(service.getFriends("qwe"));
	}

}
