package com.spring.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class TravBoardMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private TravBoardMapper mapper;

	@Test
	@Ignore
	public void testinsertTravBoard() { // 여행 후기글 삽입
		log.info(mapper);
		assertNotNull(mapper.insertTravBoard("너와 나", "우리 둘이 함께 가자", "user01"));
	}

	@Test
	@Ignore
	public void testselectTravBoardList() { // 여행 후기글 전체 출력(해쉬태그 x)
		log.info(mapper);
		List<TravBoardVO> list = mapper.selectTravBoardList();
		log.info(list);
		assertNotNull(list);
	}

	@Test
	public void testselectBoard() {// 글 상세조회 --> 해쉬태그 읽어들어오지 못함
		log.info(mapper);
		int trav_b_no = 2;
		assertNotNull(mapper.selectBoard(trav_b_no));
		log.info(mapper.selectBoard(trav_b_no));
	}

	@Test
	@Ignore
	public void testupdateTravBoard() {// 여행 후기글 수정(본인이 쓴 여행 후기글)
		log.info(mapper);
		TravBoardVO vo = new TravBoardVO();
		vo.setTitle("사랑스러운 우리 마고");
		vo.setContents("오랜만의 바다여행에 한껏 신난 살랑살랑 꼬리");
		vo.setTrav_b_no(21);
		System.out.println(mapper.updateTravBoard(vo));
	}

	@Test
	@Ignore
	public void testupdateTravBoardByIsHidden() {// 여행 후기글 숨기기(해쉬태그 x)
		log.info(mapper);
		System.out.println(mapper.updateTravBoardByIsHidden(1));
	}

	@Test
	@Ignore
	public void testupdateTravBoardToPublic() {// 여행 후기글 공개로 전환(해쉬태그 x)
		log.info(mapper);
		System.out.println(mapper.updateTravBoardToPublic(1));
	}

	@Test
	@Ignore
	public void testupdateTravBoardPlusView() {// 조회수 증가
		log.info(mapper);
		System.out.println(mapper.updateTravBoardPlusView(1));
	}

	@Test
	@Ignore
	public void testdeleteTravBoard() { // 여행 후기글 삭제
		log.info(mapper);
		System.out.println(mapper.deleteTravBoard(83));
	}

	@Test
	public void testselectAllBoard() {// 프로필(사용자 아이디로 조회)
		log.info(mapper);
		List<TravBoardVO> list = mapper.selectAllBoard("user01");
		log.info(list);
		assertNotNull(list);
	}

}
