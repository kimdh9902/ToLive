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
	public void testregisterTravBoard() {// 여행 후기글 삽입
		TravBoardVO vo = new TravBoardVO();
		vo.setTitle("내 동생 초코");
		vo.setContents("반짝반짝 빛나는 눈망울");
		vo.setUser_id("user01");
		assertNotNull(service.registerTravBoard(vo));

	}

	@Test
	@Ignore
	public void testgetTravBoardList() {// 여행 후기글 전체 출력(해쉬태그 x)
		List<TravBoardVO> list = service.getTravBoardList();
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
	public void testmodifyTravBoard() {// 여행 후기글 수정(본인이 쓴 여행 후기글)
		TravBoardVO vo = new TravBoardVO();
		vo.setTitle("사랑스러운 우리 루이와 로키와 함께");
		vo.setContents("몽실몽실 루이와 둥글둥글 로키와 함께 드라이브 나왔다! 오랜만의 나들이 ㅎㅎ");
		vo.setTrav_b_no(82);
		System.out.println(service.modifyTravBoard(vo));
	}

	@Test
	@Ignore
	public void testmodifyTravBoardByIsHidden() {// 여행 후기글 숨기기(해쉬태그 x)
		System.out.println(service.modifyTravBoardByIsHidden(82));
	}

	@Test
	@Ignore
	public void testupdateTravBoardToPublic() {// 여행 후기글 공개로 전환(해쉬태그 x)
		System.out.println(service.modifyTravBoardToPublic(82));
	}

	@Test
	@Ignore
	public void testmodifyTravBoardPlusView() {// 조회수 증가
		System.out.println(service.modifyTravBoardPlusView(82));
	}

	@Test
	@Ignore
	public void testremoveTravBoard() { // 여행 후기글 삭제
		System.out.println(service.removeTravBoard(82));
	}

	@Test
	@Ignore
	public void testgetAllBoard() {// 프로필(사용자 아이디로 조회)
		List<TravBoardVO> list = service.getAllBoard("user02");
		log.info(list);
		assertNotNull(list);
	}

}
