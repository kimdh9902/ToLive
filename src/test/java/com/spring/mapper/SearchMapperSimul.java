package com.spring.mapper;

import static org.junit.Assert.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.SearchIdVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class SearchMapperSimul {

	@Setter (onMethod_ = @Autowired)
	private SearchMapper mapper;
	
	@Test
	public void test() {
		List<SearchIdVO> list = mapper.selectId("user");
		
		for(int i = 0; i < list.size(); i++)
		{
			System.out.println(list.get(i).getUser_id());
			System.out.println(list.get(i).getUser_name());
			System.out.println(list.get(i).getProfile_img());
		}
	}

}
