package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
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
public class AlarmTest {

	@Setter (onMethod_ = @Autowired)
	private AlarmMapper mapper;
	
	@Test @Ignore
	public void test() {
		AlarmVO vo = new AlarmVO();
//		vo.setUser_id("user01");
//		vo.setB_no(1);
//		vo.setMsg("test02가 당신을 멘션");
//		mapper.insertAlarm(vo);
		List<AlarmVO> list = mapper.selectAlarmById("user01");
		log.info(list);
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		assertNotNull(list);
	}
	
	@Test @Ignore
	public void readtest() {
		mapper.updateAlarm(1);
		List<AlarmVO> list = mapper.selectAlarmById("user01");
		log.info(list);
		assertNotNull(list);
	}
	
	@Test
	public void readtest2() {
		int a = mapper.selectIsOpenCount("user01");
		log.info("true가 나왔는가? = " + a);
	}
}
