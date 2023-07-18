package com.spring.mapper;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Ignore;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.spring.domain.ReportVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ReportMapperSimul {
	
	@Setter (onMethod_ = @Autowired)
	private ReportMapper mapper;
	
	@Test @Ignore
	public void testselectAllReportBoard() {
		mapper.selectAllReportBoard();
	}
	
	@Test @Ignore
	public void testinsertReportBoard() {
		ReportVO vo = new ReportVO();
		vo.setB_no(3);
		vo.setReport_num(3);
		mapper.insertReportBoard(vo);
	}
	
	@Test @Ignore
	public void testdeleteReportBoard() {
		mapper.deleteReportBoard(3);
	}
	
	@Test @Ignore
	public void testupdateReportBoard() {
		mapper.updateReportBoard(2);
	}
	
	@Test
	public void testupdateReportPost() {
		mapper.updateReportPost(2);
	}

}
