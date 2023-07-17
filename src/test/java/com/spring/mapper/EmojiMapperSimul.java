package com.spring.mapper;

import static org.junit.Assert.*;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.EmojiVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class EmojiMapperSimul {


	@Setter(onMethod_ = @Autowired)
	private EmojiMapper mapper;

	@Test @Ignore
	public void testInsert() {
		EmojiVO vo = new EmojiVO();
		vo.setB_no(1);
		vo.setUser_id("user01");
		mapper.insertEmoji(vo);
	}
	
	@Test
	public void testUpdate() {
		EmojiVO vo = new EmojiVO();
		vo.setEmoji_record(3);
		vo.setB_no(1);
		vo.setUser_id("user01");
		mapper.updateEmoji(vo);
	}
}
