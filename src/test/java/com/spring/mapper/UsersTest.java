package com.spring.mapper;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.UsersVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class UsersTest {
	
	@Setter (onMethod_ = @Autowired)
	private UsersMapper mapper;
	
	@Test @Ignore
	public void test() {
		UsersVO vo = new UsersVO();
		vo.setId("oax123");
		vo.setPw("123");
		vo = mapper.selectAccount(vo);
		log.info(vo);
	}

	@Test
	public void test2() {
		System.out.println(mapper.selectByIdCount("user01"));
		
	}
}
