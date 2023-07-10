package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.SearchIdVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class testMapper {
	
	@Setter (onMethod_ = @Autowired)
	private SearchMapper mapper;
	
	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void test() {
		List<SearchIdVO> list = mapper.selectId("김옥수");
		log.info("name@@@@@@@@@@@@@@@"+list.get(0).getName());
		assertNotNull(list);
	}

}
