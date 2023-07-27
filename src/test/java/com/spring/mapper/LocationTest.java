package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.LocationVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")

public class LocationTest {
	
	@Setter (onMethod_ = @Autowired)
	private LocationMapper mapper;
	
	@Test
	public void test() {
		LocationVO vo = new LocationVO();
		vo.setLocation_name("서울특별시");
		List<LocationVO> list = mapper.selectLocationById(vo);
		for(int i = 0; i < list.size(); i++) {
			System.out.println(list.get(i));
		}
		
	}

}
