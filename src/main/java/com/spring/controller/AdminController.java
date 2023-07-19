package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.ReportVO;
import com.spring.service.ReportService;
import com.spring.service.StarBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
//	여행 경쟁 모드, 여행 관련 퀴즈 및 경품 이벤트, 여행 통계 및 도전 과제
	
	private final ReportService reportService;
	
	@GetMapping("/report-selectAll")
	public String selectAllReportBoard() {
//		reportService.selectAllReportBoard();
		return "report";
	}
	
	@GetMapping("/report-add")
	public void addReportBoard(ReportVO vo) {
		reportService.addReportBoard(vo);
	}
	
	@GetMapping("/report-remove")
	public void removeReportBoard(int b_no) {
		reportService.removeReportBoard(b_no);
	}
	
	@GetMapping("/report-hide")
	public void reassignReportBoard(int b_no) {
		reportService.reassignReportBoard(b_no);
	}
	
	@GetMapping("/report-open")
	public void reassignReportPost(int b_no) {
		reportService.reassignReportPost(b_no);
	}

}
