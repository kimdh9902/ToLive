package com.spring.service;

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
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class PartyBoardServiceSimul {

	@Setter(onMethod_ = @Autowired)
	private PartyBoardService service;

	@Test
	@Ignore
	public void tesregisterPartyBoard() {// 파티 모집 게시판 등록

		PartyBoardVO vo = new PartyBoardVO();
		vo.setParty_b_no(22);
		vo.setMax_people(4);
		assertNotNull(service.registerPartyBoard(vo));
	}

	@Test
	@Ignore
	public void testgetAllPartyBoard() {// 파티 모집 게시판 글 전체 출력
		List<PartyBoardVO> list = service.getPartyBoardList();
		assertNotNull(list);
		log.info(list);
	}

	@Test
	@Ignore
	public void testgetOnePartyBoard() {// 파티 모집 게시판 글번호로 조회
		assertNotNull(service.getOnePartyBoard(22));
		log.info(service.getOnePartyBoard(22));
	}

	@Test
	@Ignore
	public void testgetPartyBoardById() {// 파티 모집 게시판 글 조회(사용자 아이디)
		List<PartyBoardVO> list = service.getPartyBoardById("user03");
		log.info(list);
		assertNotNull(list);
	}

	@Test	
	@Ignore
	public void testmodifyPartyBoard() {// 파티 모집 게시판 글 수정(본인에 한하여 제목,최대 인원 사이즈 조정)
		PartyBoardVO vo = new PartyBoardVO();
		vo.setMax_people(4);
		vo.setParty_b_no(8);
		service.modifyPartyBoard(vo);
	}

	@Test
	@Ignore
	public void testupdatePartyBoardPlusMember() {// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
		service.modifyPartyBoardPlusMember(12);
	}

	@Test
	@Ignore
	public void testdeletePartyBoard() {// 파티 모집 게시판 글 삭제
		service.removePartyBoard(22);
	}

	@Test
	@Ignore
	public void testdeletePartyBoardWhenRecruitComplete() {// 최대 인원에 도달하면 자동으로 삭제 되게 만들기
		PartyBoardVO vo = new PartyBoardVO();
		assertNotNull(service.removePartyBoardWhenRecruitComplete(vo));

	}

}
