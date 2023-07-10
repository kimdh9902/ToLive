package com.spring.mapper;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BlackListMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private BlackListMapper mapper;
	
	@Test
	public void testselectAllBlackList() {
		assertNotNull(mapper.getClass().getName());
		log.info(mapper.getClass().getName());
	}
	
	@Test @Ignore
	public void testinsertBlackList() {
		
	}
	
	@Test @Ignore
	public void testdeleteBlackList() {
		
	}

}
