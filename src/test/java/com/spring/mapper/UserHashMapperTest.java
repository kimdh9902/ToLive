package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.HashVO;
import com.spring.domain.UsersHashVO;

import lombok.Setter;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class UserHashMapperTest {

	@Setter (onMethod_ = @Autowired)
	UserHashMapper mapper;
	@Test
	public void test() {
		UsersHashVO vo = new UsersHashVO();
		vo.setId("qwe");
		List<Integer> list = new ArrayList<>();
		
		list.add(1);
		list.add(2);
		list.add(3);
		vo.setHashList(list);
		mapper.insertHash(vo);
	}

}
