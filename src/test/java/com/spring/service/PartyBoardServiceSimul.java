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
	public void tesregisterPartyBoard() {// 파티 모집 게시판 등록
		PartyBoardVO vo = new PartyBoardVO();

		vo.setTitle("에버랜드에 같이 놀러갈 사람~ ");
		vo.setContents("에버랜드에서 놀이기구 같이 타고 사진 찍으면서 놀러갈 사람~! 만나서 이야기도 많이 나누고 싶어요!!");
		vo.setMax_people(3);
		vo.setUser_id("user02");
		assertNotNull(service.registerPartyBoard(vo));
	}

	@Test
	@Ignore
	public void testgetAllPartyBoard() {// 파티 모집 게시판 글 전체 출력
		List<PartyBoardVO> list = service.getAllPartyBoard();
		assertNotNull(list);
		log.info(list);
	}

	@Test
	@Ignore
	public void testgetPartyBoardByPartyBNo() {// 파티 모집 게시판 글번호로 조회
		assertNotNull(service.getPartyBoardByPartyBNo(39));
		log.info(service.getPartyBoardByPartyBNo(39));
	}

	@Test
	@Ignore
	public void testgetPartyBoardById() {// 파티 모집 게시판 글 조회(사용자 아이디)
		List<PartyBoardVO> list = service.getPartyBoardById("user01");
		log.info(list);
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testmodifyPartyBoard() {// 파티 모집 게시판 글 수정(본인에 한하여 제목,최대 인원 사이즈 조정)
		service.modifyPartyBoard("카페투어 함께하실 4분~", 4, 81);

	}

	@Test
	@Ignore
	public void testupdatePartyBoardPlusMember() {// 파티 멤버 증가(제목 클릭 시 파티 멤버 증가)
		service.modifyPartyBoardPlusMember(66);
	}

	@Test
	@Ignore
	public void testdeletePartyBoard() {// 파티 모집 게시판 글 삭제
		service.removePartyBoard(81);
	}

	@Test
	@Ignore
	public void testdeletePartyBoardWhenRecruitComplete() {// 최대 인원에 도달하면 자동으로 삭제 되게 만들기
		PartyBoardVO vo = new PartyBoardVO();
		assertNotNull(service.removePartyBoardWhenRecruitComplete(vo));

	}

}
