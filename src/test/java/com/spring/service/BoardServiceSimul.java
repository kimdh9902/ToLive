package com.spring.service;

import static org.junit.Assert.assertNotNull;

import java.util.Date;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.BoardVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceSimul {

	@Setter(onMethod_ = @Autowired)
	private BoardService service;

	@Test
	@Ignore
	public void testregisterBoard() { // 글 삽입
		BoardVO vo = new BoardVO();
		vo.setTitle("쿠키와 함께");
		vo.setContents("쿠키 향기와 더불어 사는 삶");
		vo.setUser_id("user01");

		// 현재 날짜 및 시간을 가져오기
		Date date = new Date();
		vo.setReg_date(date);

		assertNotNull(service.registerBoard(vo));
	}

	@Test	
	@Ignore
	public void testupdateBoard() { // 글 수정(본인이 쓴 글)
		BoardVO vo = new BoardVO();
		vo.setTitle("로키와 함께");
		vo.setContents("미소와 더불어 사는 삶");

		// 현재 날짜 및 시간을 가져오기
		Date date = new Date();
		vo.setReg_date(date);
		
		vo.setB_no(17);
		assertNotNull(service.modifyBoard(vo));
	}

	@Test
	@Ignore
	public void testupdateBoardByIsHidden() { // 글 숨기기
		int b_no = 17;
		assertNotNull(service.modifyBoardByIsHidden(b_no));
	}

	@Test
	@Ignore
	public void testupdateBoardToPublic() { // 글 공개로 전환
		int b_no = 17;
		assertNotNull(service.modifyBoardToPublic(b_no));
	}

	@Test
	@Ignore
	public void testdeleteBoard() { // 글 삭제
		int b_no = 17;
		assertNotNull(service.removeBoard(b_no));
	}

}
