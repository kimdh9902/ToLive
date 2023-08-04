package com.spring.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.domain.BoardCommentVO;
import com.spring.domain.BoardImageVO;
import com.spring.domain.BoardVO;
import com.spring.domain.NoticeVO;
import com.spring.domain.ReportVO;
import com.spring.domain.TravBoardVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.TravBoardMapper;
import com.spring.object.CustomUserDetails;
import com.spring.service.BoardCommentService;
import com.spring.service.NoticeService;
import com.spring.service.BoardImageService;
import com.spring.service.BoardService;
import com.spring.service.ReportService;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/travBoard")
@RequiredArgsConstructor
public class TravBoardController {

	private final TravBoardService travBoardService;
	private final ReportService reportService;
	private final BoardCommentService commentService;
	private final NoticeService noticeService;
	private final BoardImageService boardImageService;
	private final BoardService boardService;

	@Autowired
	private TravBoardMapper travBoardMapper;

	@Autowired
	private BoardMapper boardMapper;

	// 여행 후기글 글 상세 페이지로 이동
	// localhost:8080/trip/travBoard/detail
	@GetMapping("/travBoard-detail")
	public String openBoard(@RequestParam("b_no") int b_no, HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) throws IOException {
		if (request.getParameter("b_no") != null) {
			travBoardService.modifyTravBoardPlusView(Integer.parseInt(request.getParameter("b_no"))); // 제목 클릭 시 조회수 +1

			TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("b_no")));
			model.addAttribute("TravBoardVO", vo);

			List<BoardImageVO> boardImagevo = boardImageService.getImages(b_no);
			model.addAttribute("boardImagevo", boardImagevo);

			List<BoardCommentVO> boardCommentvo = commentService
					.getComments(Integer.parseInt(request.getParameter("b_no")));
			model.addAttribute("boardCommentList", boardCommentvo);
			System.out.println(boardCommentvo);
		}
		return "travBoard-detail";
//		return "detail";
	}

	// 게시글 등록 페이지로 이동
	@GetMapping("/travBoard-write")
	public String boardWrite() {
		return "travBoard-write";
	}

	// 등록 처리
	@RequestMapping(value = "/travBoard-insert", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String insertBoard(BoardVO bvo, TravBoardVO tvo, HttpSession session) throws UnsupportedEncodingException {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");

		String user_id = null;
		SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		CustomUserDetails userDetails = (CustomUserDetails) securityContext.getAuthentication().getPrincipal();
		UsersVO user = userDetails.getUserVO();
		user_id = user.getId();

		bvo.setUser_id(user_id);
		bvo.setReg_date(new Date()); // 작성일

		// 제목, 내용 추가
		int registerBoardResult = boardService.registerBoard(bvo);

		// 여행후기글에 번호 부여
		int registerToTravResult = boardService.registerToTrav(bvo);

		if (registerBoardResult > 0 && registerToTravResult > 0) {

			return "redirect:/menu/travBoard?user_id=" + user_id;
		} else {
			return "redirect:/travBoard/travBoard-write";
		}

	}

	// 수정 페이지로 이동
	@RequestMapping(value = "/travBoard-update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("b_no") int b_no) {
		model.addAttribute("travBoard", travBoardMapper.selectOneBoard(b_no));
		return "travBoard-update";
	}

	// 수정 처리
	@RequestMapping(value = "/travBoard-modify", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String updateBoard(BoardVO bvo, TravBoardVO tvo) {

		int updateBaordResult = boardMapper.updateBoard(bvo);

		if (updateBaordResult > 0) {
			return "redirect:travBoard-detail?b_no=" + bvo.getB_no();
		} else {
			return "redirect:travBoard/travBoard-update?b_no=" + bvo.getB_no();
		}
	}

	// 삭제 처리
	@RequestMapping(value = "/travBoard-delete", method = RequestMethod.GET)
	public String delete(@RequestParam("b_no") int b_no, HttpSession session) {
		boolean success = travBoardMapper.deleteTravBoard(b_no);
		boolean deleteBaord = boardMapper.deleteBoard(b_no);

		String user_id = null;
		SecurityContext securityContext = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
		CustomUserDetails userDetails = (CustomUserDetails) securityContext.getAuthentication().getPrincipal();
		UsersVO user = userDetails.getUserVO();
		user_id = user.getId();

		if (success && deleteBaord) {
			return "redirect:/menu/travBoard?user_id=" + user_id;
		} else {
			return "redirect:travBoard-detail?b_no=" + b_no + "&user_id=" + user_id;
		}
	}

	// 글 신고 페이지로 이동
	@GetMapping("/travBoard-report")
	public String Report(Model model, @RequestParam("b_no") int b_no) {
		model.addAttribute("travBoard", travBoardMapper.selectOneBoard(b_no));
		return "travBoard-report";
	}

	// 신고 처리
	@RequestMapping(value = "/report-processing", method = RequestMethod.POST)
	public String reportBoard(BoardVO bvo, ReportVO rvo) {
		reportService.addReportBoard(rvo);
		System.out.println(rvo);
		return "redirect:travBoard-detail?b_no=" + bvo.getB_no();

	}

}
