package com.spring.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.ProfileVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProfileTest {

	@Setter (onMethod_ = @Autowired)
	private ProfileMapper mapper;
	
	@Test
	public void test() {
		ProfileVO vo = new ProfileVO();
		vo.setUser_id("user01");
		vo.setManner_ondo(37.4);
		mapper.updateOndo(vo);
	}

}
