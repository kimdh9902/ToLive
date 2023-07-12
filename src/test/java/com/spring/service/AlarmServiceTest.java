package com.spring.service;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.AlarmVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class AlarmServiceTest {

	@Setter (onMethod_ = @Autowired)
	private AlarmService service;
	
	@Test
	public void test() {
		List<AlarmVO> al = service.getAlarmByUser("user01");
		log.info(al);
	}

}
