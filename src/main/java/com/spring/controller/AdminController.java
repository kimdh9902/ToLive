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
import com.spring.domain.UsersVO;
import com.spring.object.Criteria;
import com.spring.object.PageMaker;
import com.spring.service.InfluencerService;
import com.spring.service.NoticeService;
import com.spring.service.ReportService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import java.sql.Date;
import java.sql.SQLException;

import oracle.sql.DATE;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/admin/*")
public class AdminController {
	
	private final ReportService reportService;
	private final NoticeService noticeService;
	private final InfluencerService influencerService;
	private final UsersService usersService;
	
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
	
	@GetMapping("/updateInfluencer")
	public String alterInfluencer(String user_id) {
		influencerService.alterInfluencer(user_id);
		return "adminInfluencer";
	}
	
	@GetMapping("/deleteInfluencer")
	public String removeInfluencer(String user_id) {
		System.out.println("");
		influencerService.removeInfluencer(user_id);
		return "adminInfluencer";
	}
	
	@GetMapping("/report-selectAll")
	public String selectAllReportBoard(Model model) {
		List<ReportVO> reportList = reportService.selectAllReportBoard();
		model.addAttribute("reportList", reportList);
		return "report_status";
	}
	
	@GetMapping("/report-add")
	public String addReportBoard(ReportVO vo) {
		reportService.addReportBoard(vo);
		return "report_status";
	}
	
	@GetMapping("/report-remove")
	public String removeReportBoard(int b_no) {
		reportService.removeReportBoard(b_no);
		return "report_status";
	}
	
	@GetMapping("/report-hide")
	public String reassignReportBoard(int b_no) {
	
		reportService.reassignReportBoard(b_no);
		return "report_status";
	}
	
	@GetMapping("/report-open")
	public String reassignReportPost(int b_no) {
		reportService.reassignReportPost(b_no);
		return "report_status";
	}
	
	@GetMapping("/adminUserBlock")
	public String showAllUsers(Model model, Criteria cri) {
		log.info("board-all - " + cri.getPageNum());
		PageMaker pageMaker = new PageMaker(cri, usersService.getCountUser());
		model.addAttribute("userList", usersService.getAllUsers(pageMaker));
		model.addAttribute("pageMaker", pageMaker);
		return "adminUserBlock";
	}
	
	
	
	
	@GetMapping("/removeAccount")
	public String deleteUsersAccount(String id) {
		usersService.removeUsersAccount(id);
		return "adminUserBlock";
	}
	
	@GetMapping("/updateGradeToZero")
	public String updateUsersGradeZero(String id) {
		usersService.registerUsersGradeZero(id);
		return "adminUserBlock";
	}
}
