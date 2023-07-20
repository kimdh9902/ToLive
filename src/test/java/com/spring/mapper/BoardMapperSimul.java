package com.spring.mapper;

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
public class BoardMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Test
	@Ignore
	public void testinsertBoard() { // 글 삽입
		BoardVO vo = new BoardVO();
		vo.setTitle("맛있는 녹차와 함께");
		vo.setContents("녹차 향기와 더불어 사는 삶을 살아보자");
		vo.setUser_id("user01");

		// 현재 날짜 및 시간을 가져오기
		Date date = new Date();
		vo.setReg_date(date);

		assertNotNull(mapper.insertBoard(vo));
	}

	@Test
	@Ignore
	public void testupdateBoard() { // 글 수정(본인이 쓴 글)
		BoardVO vo = new BoardVO();
		vo.setTitle("루크와 함께");
		vo.setContents("미소와 더불어 사는 삶");
		
		//현재 날짜 및 시간을 가져오기
		Date date = new Date();
		vo.setReg_date(date);

		vo.setB_no(16);
		assertNotNull(mapper.updateBoard(vo));
	}

	@Test
	@Ignore
	public void testupdateBoardByIsHidden() { // 글 숨기기
		int b_no = 16;
		assertNotNull(mapper.updateBoardByIsHidden(b_no));
	}

	@Test
	@Ignore
	public void testupdateBoardToPublic() { // 글 공개로 전환
		int b_no = 16;
		assertNotNull(mapper.updateBoardToPublic(b_no));
	}

	@Test
	@Ignore
	public void testdeleteBoard() { // 글 삭제
		int b_no = 16;
		assertNotNull(mapper.deleteBoard(b_no));
	}
}
