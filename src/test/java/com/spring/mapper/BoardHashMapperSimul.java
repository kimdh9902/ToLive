package com.spring.mapper;

import static org.junit.Assert.*;

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
	public void testinsertBoardHash() {// 여행후기글 해쉬태그 등록(사용자)
		log.info(mapper);
		BoardHashVO vo = new BoardHashVO();
		vo.setB_no(82);
		vo.setHash_id(40);
		System.out.println(mapper.insertBoardHash(vo));
	}

	@Test
	@Ignore
	public void testinsertDefaultHash() {// 글 쓰고 default 해쉬 추가해주기
		log.info(mapper);
		int b_no = 82;
		assertNotNull(mapper.insertDefaultHash(b_no));
	}

	@Test
	@Ignore
	public void testupdateBoardHash() {// 여행후기글 해쉬태그 수정
		log.info(mapper);
		BoardHashVO vo = new BoardHashVO();
		vo.setHash_id(44);
		vo.setB_h_no(51);
		System.out.println(mapper.updateBoardHash(vo));
	}

	@Test
	@Ignore
	public void testdeleteBoardHash() { // 여행 후기글 해쉬태그 삭제
		log.info(mapper);
		int b_h_no = 106;
		assertNotNull(mapper.deleteBoardHash(b_h_no));
	}

}
