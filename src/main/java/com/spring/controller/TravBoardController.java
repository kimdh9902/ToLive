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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.domain.TravBoardVO;
import com.spring.mapper.TravBoardMapper;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/travBoard")
@RequiredArgsConstructor
public class TravBoardController {

	private final TravBoardService travBoardService;

	@Autowired
	private TravBoardMapper mapper;

	// 여행 후기글 글 상세 페이지로 이동
	// localhost:8080/trip/travBoard/detail
	@GetMapping("/detail")
	public String openBoard(HttpServletRequest request, HttpServletResponse response, Model model, HttpSession session)
			throws IOException {
		int SESS_GRADE = (int) session.getAttribute("SESS_GRADE");
		if (request.getParameter("trav_b_no") != null) {
			if (SESS_GRADE != 7) {
				travBoardService.modifyTravBoardPlusView(Integer.parseInt(request.getParameter("trav_b_no"))); // 제목 클릭

				TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("trav_b_no")));
				model.addAttribute("title", vo.getTitle());
				model.addAttribute("user_id", vo.getUser_id());
				model.addAttribute("contents", vo.getContents());
				model.addAttribute("emoji1_is_check", vo.getEmoji1_is_check());
				model.addAttribute("emoji2_is_check", vo.getEmoji2_is_check());
				model.addAttribute("emoji3_is_check", vo.getEmoji3_is_check());
				model.addAttribute("views", vo.getViews());

				System.out.println(vo);

				return "detail";
			} else {
				TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("trav_b_no")));
				model.addAttribute("title", vo.getTitle());
				model.addAttribute("user_id", vo.getUser_id());
				model.addAttribute("contents", vo.getContents());
				model.addAttribute("emoji1_is_check", vo.getEmoji1_is_check());
				model.addAttribute("emoji2_is_check", vo.getEmoji2_is_check());
				model.addAttribute("emoji3_is_check", vo.getEmoji3_is_check());
				model.addAttribute("views", vo.getViews());
			}
		}

		return "detail";
	}

	// 게시글 등록 페이지로 이동
	@GetMapping("/board-write")
	public String boardWrite() {
		return "board-write";
	}

	// 등록 처리
	@RequestMapping(value = "/board-insert", method = RequestMethod.POST)
	public String insertBoard(TravBoardVO vo, HttpSession session) throws UnsupportedEncodingException {
		vo.setTitle(new String(vo.getTitle().getBytes("iso-8859-1"), "UTF-8"));
		vo.setContents(new String(vo.getContents().getBytes("iso-8859-1"), "UTF-8"));
		vo.setUser_id((String) session.getAttribute("SESS_ID"));
		System.out.println();

		int result = mapper.insertTravBoard(vo);

		if (result > 0) {
			return "redirect:/menu/travBoard/";
		} else {
			return "redirect:/travBoard/board-write";
		}
	}
}
