package com.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.PartyBoardVO;
import com.spring.mapper.PartyBoardMapper;
import com.spring.service.PartyBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/partyBoard/*")
@RequiredArgsConstructor
public class PartyBoardcontroller {

	private final PartyBoardService partyBoardService;

	@Autowired
	private PartyBoardMapper mapper;

	// 파티 모집 게시판 상세 글 페이지로 이동
	@GetMapping("/Pdetail")
	public String PartyBoardPlusMember(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws IOException {
		int SESS_GRADE = (int) session.getAttribute("SESS_GRADE");
		if ((request.getParameter("party_b_no")) != null) {
			partyBoardService.modifyPartyBoardPlusMember(Integer.parseInt(request.getParameter("party_b_no")));

			PartyBoardVO vo = partyBoardService
					.getPartyBoardByPartyBNo(Integer.parseInt(request.getParameter("party_b_no")));

			model.addAttribute("title", vo.getTitle());
			model.addAttribute("contents", vo.getContents());
			model.addAttribute("now_people", vo.getNow_people());
			model.addAttribute("max_people", vo.getMax_people());
			model.addAttribute("user_id", vo.getUser_id());

			System.out.println(vo);

			return "Pdetail";

		} else {
			PartyBoardVO vo = partyBoardService
					.getPartyBoardByPartyBNo(Integer.parseInt(request.getParameter("party_b_no")));

			model.addAttribute("title", vo.getTitle());
			model.addAttribute("contents", vo.getContents());
			model.addAttribute("now_people", vo.getNow_people());
			model.addAttribute("max_people", vo.getMax_people());
			model.addAttribute("user_id", vo.getUser_id());

			System.out.println(vo);

		}

		return "Pdetail";
	}

	// 게시글 등록 페이지로 이동
	@GetMapping("/pboard-write")
	public String pboardWrite() {
		return "pboard-write";
	}

	// 등록 처리
	@RequestMapping(value = "/pboard-insert", method = RequestMethod.POST)
	public String insertPartyBoard(PartyBoardVO vo, HttpSession session) throws UnsupportedEncodingException {
		vo.setTitle(new String(vo.getTitle().getBytes("iso-8859-1"), "UTF-8"));
		vo.setContents(new String(vo.getContents().getBytes("iso-8859-1"), "UTF-8"));
		vo.setUser_id((String) session.getAttribute("SESS_ID"));

		System.out.println(vo);

		int result = mapper.insertPartyBoard(vo);

		if (result > 0) {
			return "redirect:/menu/partyBoard/";
		} else {
			return "redirect:/partyBoard/pboard-write";
		}

	}

}
