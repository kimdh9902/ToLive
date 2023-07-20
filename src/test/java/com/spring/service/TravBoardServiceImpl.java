package com.spring.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.TravBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class TravBoardServiceImpl {

	@Setter(onMethod_ = @Autowired)
	private TravBoardService service;

	@Test
	@Ignore
	public void testgetTravBoardList() {// 여행 후기글 전체 출력(해쉬태그 x)

		List<TravBoardVO> list = service.getTravBoardList("user03");
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testgetBoard() {// 글 상세조회 --> 해쉬태그 읽어들어오지 못함
		int trav_b_no = 1;
		assertNotNull(service.getBoard(trav_b_no));
		log.info(service.getBoard(trav_b_no));
	}

	@Test
	@Ignore
	public void testmodifyTravBoardPlusView() {// 조회수 증가
		System.out.println(service.modifyTravBoardPlusView(2));
	}

	@Test
	@Ignore
	public void testgetAllBoard() {// 프로필(사용자 아이디로 조회)
		List<TravBoardVO> list = service.getAllBoard("user02");
		log.info(list);
		assertNotNull(list);
	}

}
