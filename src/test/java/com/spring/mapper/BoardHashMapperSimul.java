package com.spring.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardHashVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardHashMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private BoardHashMapper mapper;

	@Test
	@Ignore
	public void testinsertBoardHash() {
		log.info(mapper);
		BoardHashVO vo = new BoardHashVO();
		vo.setB_no(82);
		vo.setHash_id(40);
		System.out.println(mapper.insertBoardHash(vo));
	}
	
	@Test@Ignore
	public void testinsertDefaultHash() {
		log.info(mapper);
		int b_no=82;
		assertNotNull(mapper.insertDefaultHash(b_no));
	}
	
	@Test@Ignore
	public void testupdateBoardHash() {
		log.info(mapper);
		BoardHashVO vo = new BoardHashVO();
		vo.setHash_id(44);
		vo.setB_h_no(51);
		System.out.println(mapper.updateBoardHash(vo));
	}
	
	@Test@Ignore
	public void testdeleteBoardHash() {
		log.info(mapper);
		int b_h_no=106;
		assertNotNull(mapper.deleteBoardHash(b_h_no));
	}

}
