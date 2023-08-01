package com.spring.mapper;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
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
	@Setter (onMethod_ = @Autowired)
	PasswordEncoder passEncoder;
	
	@Test @Ignore
	public void test() {
		UsersVO vo = new UsersVO();
		vo.setId("oax123");
		vo.setPw("123");
		vo = mapper.selectAccount(vo);
		log.info(vo);
	}

	@Test @Ignore
	public void test2() {
		mapper.selectGradeById("user01");
		
	}
	
	@Test @Ignore
	public void test3() {
		System.out.println("null 죽이겠다 null이면 = "+mapper.selectAccountById("user01"));
		
	}
	
	@Test @Ignore
	public void test4() {
		UsersVO vo = new UsersVO();
		vo.setId(null);
		vo.setPw(null);
		vo.setName(null);
		vo.setBirthday(null);
		vo.setPhone_number(null);
		vo.setLocation_id(0);
		
		mapper.insertAccount(null);
	}

	@Test
	public void test5() {
		UsersVO vo = new UsersVO();
		vo.setPw("qwe123");
		vo.setPw(passEncoder.encode(vo.getPw()));
		System.out.println("what2:"+vo.getPw());
		System.out.println("what?:" +vo.getPw());
	}
	
}
