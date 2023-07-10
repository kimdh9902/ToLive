package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BlackListVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BlackListMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private BlackListMapper mapper;
	
	@Test @Ignore
	public void testselectAllBlackList() {
		List<BlackListVO> list = mapper.selectAllBlackList("user02");
		assertNotNull(list);
	}
	
	@Test @Ignore
	public void testinsertBlackList() {
		mapper.insertBlackList("user02", "celeb01");
		log.info("###########돌긴했음########");
		List<BlackListVO> list = mapper.selectAllBlackList("user02");
		assertNotNull(list);
	}
	
	@Test @Ignore
	public void testdeleteBlackList() {
		mapper.deleteBlackList("user02", "celeb01");
		log.info("###########돌긴했음########");
		assertNotNull(mapper.selectAllBlackList("user02"));
	}

}
