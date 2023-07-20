package com.spring.mapper;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.PartyBoardVO;
import com.spring.domain.TravBoardVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class PartyBoardMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private PartyBoardMapper mapper;

	@Test
	@Ignore
	public void tesinsertPartyBoard() {// 파티 모집 게시판 등록
		log.info(mapper);
		PartyBoardVO vo = new PartyBoardVO();
		vo.setParty_b_no(21);
		vo.setMax_people(4);
		assertNotNull(mapper.insertPartyBoard(vo));

	}

	@Test
	@Ignore
	public void testselectAllPartyBoard() {// 파티 모집 게시판 글 전체 출력
		log.info(mapper);
		List<PartyBoardVO> list = mapper.selectPartyBoardList();
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testselectOnePartyBoard() {// 파티 모집 게시판 글번호로 조회
		log.info(mapper);
		int b_no = 22;
		int max_people = 4;
		PartyBoardVO vo = new PartyBoardVO();
		vo.setParty_b_no(b_no);
		vo.setMax_people(max_people);
		mapper.insertPartyBoard(vo);
		assertNotNull(mapper.selectOnePartyBoard(b_no));
		log.info(mapper.selectOnePartyBoard(b_no));
	}

	@Test
	@Ignore
	public void testselectPartyBoardById() {// 파티 모집 게시판 글 조회(사용자 아이디)
		log.info(mapper);
		List<PartyBoardVO> list = mapper.selectPartyBoardById("user03");
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testupdatePartyBoard() {// 파티 모집 게시판 글 수정(본인에 한하여 제목,최대 인원 사이즈 조정)
		log.info(mapper);
		PartyBoardVO vo = new PartyBoardVO();
		vo.setMax_people(5);
		vo.setParty_b_no(13);
		mapper.updatePartyBoard(vo);
	}

	@Test
	@Ignore
	public void testupdatePartyBoardPlusMember() {// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
		log.info(mapper);
		mapper.updatePartyBoardPlusMember(11);
	}

	@Test
	@Ignore
	public void testdeletePartyBoard() {// 파티 모집 게시판 삭제
		log.info(mapper);
		mapper.deletePartyBoard(22);
	}

	@Test
	@Ignore
	public void testdeletePartyBoardWhenRecruitComplete() {
		PartyBoardVO vo = new PartyBoardVO();
		assertNotNull(mapper.deletePartyBoardWhenRecruitComplete(vo));
	}

}
