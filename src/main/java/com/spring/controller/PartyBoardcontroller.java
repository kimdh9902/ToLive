package com.spring.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.PartyBoardVO;
import com.spring.service.PartyBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/partyBoard/*")
@RequiredArgsConstructor
public class PartyBoardcontroller {

	private final PartyBoardService partyBoardService;

	//파티 모집 게시판 상세 글 페이지로 이동
	@GetMapping("/Pdetail")
	public String PartyBoardPlusMember(HttpServletRequest request, HttpServletResponse response, Model model,
			HttpSession session) throws IOException {
		int SESS_GRADE = (int) session.getAttribute("SESS_GRADE");
		if ((request.getParameter("party_b_no")) != null) {
			partyBoardService.modifyPartyBoardPlusMember(Integer.parseInt(request.getParameter("party_b_no")));

			PartyBoardVO vo = partyBoardService
					.getPartyBoardByPartyBNo(Integer.parseInt(request.getParameter("party_b_no")));
			model.addAttribute("title", vo.getTitle());
			model.addAttribute("contents",vo.getContents());
			model.addAttribute("now_people",vo.getNow_people());
			model.addAttribute("max_people",vo.getMax_people());
			model.addAttribute("user_id",vo.getUser_id());

			System.out.println(vo);

			return "Pdetail";

		}

		return "Pdetail";

	}

}
