package com.spring.service;

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
public class BoardHashServiceSimul {

	@Setter(onMethod_ = @Autowired)
	private BoardHashService service;

	@Test
	@Ignore
	public void testregisterBoardHash() {// 여행후기글 해쉬태그 등록(사용자)
		BoardHashVO vo = new BoardHashVO();
		vo.setB_no(83);
		vo.setHash_id(40);
		System.out.println(service.registerBoardHash(vo));
	}

	@Test
	@Ignore
	public void testregisterDefaultHash() {// 글 쓰고 default 해쉬 추가해주기
		int b_no = 83;
		assertNotNull(service.registerDefaultHash(b_no));
	}

	@Test
	@Ignore
	public void testmodifyBoardHash() {// 여행후기글 해쉬태그 수정
		BoardHashVO vo = new BoardHashVO();
		vo.setHash_id(94);
		vo.setB_h_no(44);
		System.out.println(service.modifyBoardHash(vo));
	}

	@Test
	@Ignore
	public void testremoveBoardHash() { // 여행 후기글 해쉬태그 삭제
		int b_h_no = 44;
		assertNotNull(service.removeBoardHash(b_h_no));
	}
}
