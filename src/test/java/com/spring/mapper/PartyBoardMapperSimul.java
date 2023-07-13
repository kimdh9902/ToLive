package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.PartyBoardVO;

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
		assertNotNull(mapper.insertPartyBoard("광주팟 3명 구함", 3, "user04"));

	}

	@Test
	@Ignore
	public void testselectAllPartyBoard() {// 파티 모집 게시판 글 전체 출력
		log.info(mapper);
		List<PartyBoardVO> list = mapper.selectAllPartyBoard();
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testselectPartyBoardByPartyBNo() {// 파티 모집 게시판 글번호로 조회
		log.info(mapper);
		assertNotNull(mapper.selectPartyBoardByPartyBNo(85));
	}

	@Test
	@Ignore
	public void testselectPartyBoardById() {// 파티 모집 게시판 글 조회(사용자 아이디)
		log.info(mapper);
		List<PartyBoardVO> list = mapper.selectPartyBoardById("user01");
		log.info(list);
		assertNotNull(list);

	}

	@Test
	@Ignore
	public void testupdatePartyBoard() {// 파티 모집 게시판 글 수정(본인에 한하여 제목,최대 인원 사이즈 조정)
		log.info(mapper);
		mapper.updatePartyBoard("헤이리 예술마을 같이 둘러볼 사람 4분 모집합니다!", 4, 44);
	}

	@Test
	@Ignore
	public void testupdatePartyBoardPlusMember() {// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
		log.info(mapper);
		mapper.updatePartyBoardPlusMember(44);
		log.info(mapper.updatePartyBoardPlusMember(44));
	}

	@Test
	@Ignore
	public void testdeletePartyBoard() {
		log.info(mapper);
		mapper.deletePartyBoard(85);
	}

	@Test
	@Ignore
	public void testdeletePartyBoardWhenRecruitComplete() {
		PartyBoardVO vo = new PartyBoardVO();
		assertNotNull(mapper.deletePartyBoardWhenRecruitComplete(vo));
	}

}
