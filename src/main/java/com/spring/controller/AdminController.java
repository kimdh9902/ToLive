package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.domain.BoardCommentVO;
import com.spring.domain.BoardImageVO;
import com.spring.domain.InfluencerVO;
import com.spring.domain.NoticeVO;
import com.spring.domain.ReportVO;
import com.spring.domain.TravBoardVO;
import com.spring.domain.UsersVO;
import com.spring.object.Criteria;
import com.spring.object.PageMaker;
import com.spring.service.BoardCommentService;
import com.spring.service.BoardImageService;
import com.spring.service.BoardService;
import com.spring.service.InfluencerService;
import com.spring.service.NoticeService;
import com.spring.service.ReportService;
import com.spring.service.TravBoardService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

import java.io.IOException;
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
	private final TravBoardService travBoardService;
	private final BoardImageService boardImageService;
	private final BoardCommentService commentService;
	private final BoardService boardService;
	private final TravBoardService travboardService;
	
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
	
	//신고글 숨기기
	@RequestMapping(value = "/updatehidden", method = RequestMethod.GET)
	public String boardHidden(@RequestParam("b_no") int b_no) {
		boardService.modifyBoardByIsHidden(b_no);
		reportService.removeReportBoard(b_no);
		return "redirect:/admin/report-selectAll";
	}
	
	//신고글 삭제
	@RequestMapping(value = "/adminReportDelete", method = RequestMethod.GET)
	public String boardDelete(@RequestParam("b_no") int b_no) {
		travboardService.removeTravBoard(b_no);
		boardService.removeBoard(b_no);
		reportService.removeReportBoard(b_no);
		return "redirect:/admin/report-selectAll";
	}
	
	@GetMapping("/admin-detail")
	public String openBoard(@RequestParam("b_no") int b_no, HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) throws IOException {
		if (request.getParameter("b_no") != null) {
			TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("b_no")));
			model.addAttribute("TravBoardVO", vo);

			List<BoardImageVO> boardImagevo = boardImageService.getImages(b_no);
			model.addAttribute("boardImagevo", boardImagevo);

			List<BoardCommentVO> boardCommentvo = commentService
					.getComments(Integer.parseInt(request.getParameter("b_no")));
			model.addAttribute("boardCommentList", boardCommentvo);
			System.out.println(boardCommentvo);
		}
		return "adminDetail";
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
