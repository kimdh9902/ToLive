package com.spring.mapper;

import static org.junit.Assert.assertNotNull;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TravBoardMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private TravBoardMapper mapper;

	@Test
	@Ignore
	public void testselectTravBoardList() { // 여행 후기글 전체 출력(해쉬태그 x)
		log.info(mapper);
		List<TravBoardVO> list = mapper.selectTravBoardList("user03");
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testselectBoard() {// 글 상세조회
		log.info(mapper);
		int b_no = 19;
		TravBoardVO vo = new TravBoardVO();
		vo.setTrav_b_no(b_no);
		assertNotNull(mapper.selectOneBoard(b_no));
		log.info(mapper.selectOneBoard(b_no));
	}

	@Test
	@Ignore
	public void testupdateTravBoardPlusView() {// 조회수 증가
		log.info(mapper);
		System.out.println(mapper.updateTravBoardPlusView(1));
	}

	@Test
	@Ignore
	public void testselectAllBoard() {// 프로필(사용자 아이디로 조회)
		log.info(mapper);
		List<TravBoardVO> list = mapper.selectAllBoard("user01");
		log.info(list);
		assertNotNull(list);
	}

	
	@Test

	public void deleteTravBoard() {// 프로필(사용자 아이디로 조회)
		log.info(mapper);
		int b_no=56;		
		assertNotNull(mapper.deleteTravBoard(b_no));
		log.info(mapper.deleteTravBoard(b_no));
	}
}
