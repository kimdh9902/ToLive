package com.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.BoardVO;
import com.spring.domain.PartyBoardVO;
import com.spring.domain.ReportVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.PartyBoardMapper;
import com.spring.mapper.ReportMapper;
import com.spring.service.PartyBoardService;
import com.spring.service.ReportService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/partyBoard/*")
@RequiredArgsConstructor
public class PartyBoardcontroller {

	private final PartyBoardService partyBoardService;

	@Autowired
	private PartyBoardMapper mapper;

	@Autowired
	private BoardMapper boardMapper;

	@Autowired
	private ReportMapper reportMapper;
	
	private final ReportService reportService;

	// 파티 모집 게시판 상세 글 페이지로 이동
	@GetMapping("/partyBoard-detail")
	public String PartyBoardPlusMember(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws IOException {
		int SESS_GRADE = (int) session.getAttribute("SESS_GRADE");
		if ((request.getParameter("b_no")) != null) {
			if (SESS_GRADE != 7) {

				partyBoardService.modifyPartyBoardPlusMember(Integer.parseInt(request.getParameter("b_no")));

				PartyBoardVO vo = partyBoardService.getOnePartyBoard(Integer.parseInt(request.getParameter("b_no")));
				model.addAttribute("partyBoardVO", vo);

				return "partyBoard-detail";

			} else {
				PartyBoardVO vo = partyBoardService.getOnePartyBoard(Integer.parseInt(request.getParameter("b_no")));
				model.addAttribute("partyBoardVO", vo);

			}

		}
		return "partyBoard-detail";
	}

	// 게시글 등록 페이지로 이동
	@GetMapping("/partyBoard-write")
	public String pboardWrite() {
		return "partyBoard-write";
	}

	// 등록 처리
	@RequestMapping(value = "/partyBoard-insert", method = RequestMethod.POST)
	public String insertPartyBoard(BoardVO bvo, PartyBoardVO pvo, HttpSession session)
			throws UnsupportedEncodingException {

		bvo.setUser_id((String) session.getAttribute("SESS_ID"));
		bvo.setReg_date(new Date());

		int result = boardMapper.insertBoard(bvo);

		System.out.println("여기-" + result);
		System.out.println("여기-" + boardMapper.insertBoard(bvo));

		int result2 = boardMapper.insertToParty(pvo);

		System.out.println("여기2-" + result2);

		if (result + result2 > 0) {
			return "redirect:/menu/partyBoard/";
		} else {
			return "redirect:/partyBoard/partyBoard-write";
		}
	}

	// 수정 페이지로 이동
	@RequestMapping(value = "/partyBoard-update", method = RequestMethod.GET)
	public String pupdate(Model model, @RequestParam("b_no") int b_no) {
		model.addAttribute("partyBoard", mapper.selectOnePartyBoard(b_no));
		return "partyBoard-update";

	}

	// 수정 처리
	@RequestMapping(value = "/partyBoard-modify", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String updatePBoard(BoardVO bvo, PartyBoardVO pvo) {

		int result = boardMapper.updateBoard(bvo);
		int result2 = boardMapper.updatePartyBoard(pvo);

		if (result + result2 > 0) {
			return "redirect:partyBoard-detail?b_no=" + bvo.getB_no();
		} else {
			return "redirect:partyBoard/partyBoard-update?b_no=" + bvo.getB_no();
		}
	}

	// 삭제 처리
	@GetMapping(value = "/partyBoard-delete")
	public String delete(@RequestParam("b_no") int b_no) {
		boolean success = mapper.deletePartyBoard(b_no);

		if (success) {
			return "redirect:/menu/partyBoard/";
		} else {
			return "redirect:partyBoard-detail?b_no=" + b_no;
		}
	}

	// 글 신고 페이지로 이동
	@GetMapping("/partyBoard-report")
	public String Report(Model model, @RequestParam("b_no") int b_no) {
		model.addAttribute("partyBoard", mapper.selectOnePartyBoard(b_no));
		return "partyBoard-report";
	}

	// 신고 처리
	@RequestMapping(value = "/report-processing", method = RequestMethod.POST)
	public String reportBoard(BoardVO bvo, ReportVO rvo) {	
		System.out.println("여기 왔니?");
		reportService.addReportBoard(rvo);
		System.out.println(rvo);		
		return "redirect:partyBoard-detail?b_no=" + bvo.getB_no();

	}
}
