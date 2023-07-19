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
import org.springframework.web.bind.annotation.RequestParam;
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
		vo.setTitle(new String(vo.getTitle()));
		vo.setContents(new String(vo.getContents()));
		vo.setUser_id((String) session.getAttribute("SESS_ID"));

		System.out.println(vo);

		int result = mapper.insertPartyBoard(vo);

		if (result > 0) {
			return "redirect:/menu/partyBoard/";
		} else {
			return "redirect:/partyBoard/pboard-write";
		}
	}

	// 수정 페이지로 이동
	@RequestMapping(value = "/pboard-update", method = RequestMethod.GET)
	public String pupdate(Model model, @RequestParam("party_b_no") int party_b_no) {
		model.addAttribute("partyBoard", mapper.selectPartyBoardByPartyBNo(party_b_no));
		return "pboard-update";

	}

	// 수정 처리
	@RequestMapping(value = "/board-pupdate", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String updatePBoard(PartyBoardVO vo) {
		System.out.println("여기-" + vo);
		int result = mapper.updatePartyBoard(vo);
		if (result > 0) {
			return "redirect:Pdetail?party_b_no=" + vo.getParty_b_no();
		} else {
			return "redirect:partyBoard/pboard-update?party_b_no=" + vo.getParty_b_no();
		}
	}

	// 삭제 처리
	@GetMapping(value = "/pboard-delete")
	public String delete(int party_b_no) {
				
		boolean success = mapper.deletePartyBoard(party_b_no);
		System.out.println(mapper.deletePartyBoard(party_b_no));
		if (success) {
			return "redirect:/menu/partyBoard/";
		} else {
			return "redirect:Pdetail?party_b_no=" + party_b_no;
		}
	}

}
