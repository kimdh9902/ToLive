package com.spring.service;

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
public class HashServiceSimul {

	@Setter(onMethod_ = @Autowired)
	private HashService service;

	@Test
	@Ignore
	public void testgetHashList() {// 해쉬태그 전체 출력
//		List<HashVO> list = service.getHashList();
//		assertNotNull(list);
//		log.info(list);
	}

	@Test
	@Ignore
	public void testgetHash() {// 해쉬코드 아이디로 해쉬코드 조회
		int hash_id = 40;
		assertNotNull(service.getHash(hash_id));
		log.info(service.getHash(hash_id));
	}

	@Test
	@Ignore
	public void testregisterHash() {// 해쉬태그명 추가
		assertNotNull(service.registerHash("보라색"));
	}

	@Test
	@Ignore
	public void testmodifyHashTag() {// 해쉬태그 수정(사용자)
		assertNotNull(service.modifyHashTag("식물"));
	}

	@Test
	@Ignore
	public void testremoveHash() {// 해쉬코드 아이디로 해쉬코드 삭제
		assertNotNull(service.removeHash(0));
	}
}
