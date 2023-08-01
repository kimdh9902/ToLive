package com.spring.controller;

import java.util.List;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.InfluencerVO;
import com.spring.domain.NoticeVO;
import com.spring.domain.ReportVO;
import com.spring.service.InfluencerService;
import com.spring.service.NoticeService;
import com.spring.service.ReportService;

import lombok.RequiredArgsConstructor;

import java.sql.Date;
import java.sql.SQLException;

import oracle.sql.DATE;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/*")
public class AdminController {
	
	private final ReportService reportService;
	private final NoticeService noticeService;
	private final InfluencerService influencerService;

	@GetMapping("")
    public String adminMain(Model model) {
        NoticeVO notice = noticeService.getNotice();
        model.addAttribute("noticeVO", notice);
        return "admin";
    }
	
	@GetMapping("/notice")
	public String adminNotice() {
		return "noticeInsert";
	}
	
	@GetMapping("/notice-upload")
	public String insertNotice(NoticeVO vo) throws SQLException {
	    System.out.println(vo);  
	    noticeService.addNotice(vo);
	    return "noticeInsert";
	}
	
	@Scheduled(cron = "0 0 0 3 * ?")//순서대로 초,분,시,일,월,요일 초기화 기준 정해줌
	@GetMapping("/notice-delete")	//cron표현식에서 *은 모든 값, ?는 값을 할당하지 않음
	public void deleteNotice(){
	    noticeService.removeNotice();
	}
	
	@GetMapping("/select-Influencer")
	public String selectInfluencer(Model model) {
		List<InfluencerVO> influencerList =influencerService.getInfluencer();
		model.addAttribute("influencerList", influencerList);
		return "adminInfluencer";
	}
	
	@GetMapping("/insertInfluencer")
	public void addInfluencer(String user_id) {
		influencerService.setInfluencer(user_id);
	}
	
	@GetMapping("/updateInfluencer")
	public void alterInfluencer(String user_id) {
		influencerService.alterInfluencer(user_id);
	}
	
	@GetMapping("/deleteInfluencer")
	public void removeInfluencer(String user_id) {
		influencerService.removeInfluencer(user_id);
	}
	
	@GetMapping("/report-selectAll")
	public String selectAllReportBoard(Model model) {
		List<ReportVO> reportList = reportService.selectAllReportBoard();
		model.addAttribute("reportList", reportList);
//		return "admin";
		return "report_status2";
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
