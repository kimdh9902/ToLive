package com.spring.mapper;


import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.HashVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class HashMapperSimul {

	@Setter(onMethod_ = @Autowired)
	private HashMapper mapper;

	@Test
	@Ignore
	public void testselectHashList() {// 해쉬태그 전체 출력
		log.info(mapper);
		List<HashVO> list = mapper.selectHashList();
		assertNotNull(list);
	}

	@Test
	@Ignore
	public void testselectHash() {// 해쉬코드 아이디로 해쉬코드 조회
		log.info(mapper);
		int hash_id = 40;
		assertNotNull(mapper.selectHash(hash_id));

	}

	@Test
	@Ignore
	public void testinsertHash() {// 해쉬태그명 추가
		log.info(mapper);
		assertNotNull(mapper.insertHash("대나무숲"));

	}

	@Test@Ignore
	public void updateHashTag() {// 해쉬태그 수정(사용자) 
		log.info(mapper);
		assertNotNull(mapper.updateHashTag("앵무새"));

	}
	
	@Test
	@Ignore
	public void testdeleteHash() {// 해쉬코드 아이디로 해쉬코드 삭제
		log.info(mapper);
		assertNotNull(mapper.deleteHash(62));

	}

}
