package com.spring.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.domain.BoardVO;
import com.spring.domain.TravBoardVO;
import com.spring.mapper.BoardMapper;
import com.spring.mapper.TravBoardMapper;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/travBoard")
@RequiredArgsConstructor
public class TravBoardController {

	private final TravBoardService travBoardService;

	@Autowired
	private TravBoardMapper travBoardMapper;

	@Autowired
	private BoardMapper boardMapper;

	// 여행 후기글 글 상세 페이지로 이동
	// localhost:8080/trip/travBoard/detail
	@GetMapping("/detail5")
	public String openBoard(@RequestParam("b_no") int b_no, HttpServletRequest request, HttpServletResponse response,
			Model model, HttpSession session) throws IOException {
		int SESS_GRADE = (int) session.getAttribute("SESS_GRADE");
		if (request.getParameter("b_no") != null) {
			if (SESS_GRADE != 7) {

				travBoardService.modifyTravBoardPlusView(Integer.parseInt(request.getParameter("b_no"))); // 제목 클릭 시 조회수 증가
																										
				// vo에 포장
				TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("b_no")));
				model.addAttribute("TravBoardVO", vo);

				return "detail";

			} else {
				TravBoardVO vo = travBoardService.getBoard(Integer.parseInt(request.getParameter("b_no")));
				model.addAttribute("TravBoardVO", vo);

			}
		}

		return "detail5";
	}

	// 게시글 등록 페이지로 이동
	@GetMapping("/board-write")
	public String boardWrite() {
		return "board-write";
	}

	// 등록 처리
	@RequestMapping(value = "/board-insert", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String insertBoard(BoardVO bvo, TravBoardVO tvo, HttpSession session) throws UnsupportedEncodingException {

		bvo.setUser_id((String) session.getAttribute("SESS_ID"));
		bvo.setReg_date(new Date());

		int result = boardMapper.insertBoard(bvo);
		int result2 = boardMapper.insertToTrav(bvo);

		// 확인용
		System.out.println("여기01-" + bvo);
		System.out.println("여기02-" + tvo);

		if (result + result2 > 0) {
			return "redirect:/menu/travBoard/";
		} else {
			return "redirect:/travBoard/board-write";
		}
	}

	// 수정 페이지로 이동
	@RequestMapping(value = "/board-update", method = RequestMethod.GET)
	public String update(Model model, @RequestParam("b_no") int b_no) {
		model.addAttribute("travBoard", travBoardMapper.selectOneBoard(b_no));
		return "board-update";
	}

	// 수정 처리
	@RequestMapping(value = "/board-tupdate", method = RequestMethod.POST, produces = "text/html; charset=UTF-8")
	public String updateBoard(BoardVO bvo, TravBoardVO tvo) {

		int result = boardMapper.updateBoard(bvo);

		if (result > 0) {
			return "redirect:detail?b_no=" + bvo.getB_no();
		} else {
			return "redirect:travBoard/board-update?b_no=" + bvo.getB_no();
		}
	}

	// 삭제 처리
	@RequestMapping(value = "/board-delete", method = RequestMethod.GET)
	public String delete(@RequestParam("b_no") int b_no) {
		boolean success = travBoardMapper.deleteTravBoard(b_no);
		if (success) {
			return "redirect:/menu/travBoard/";
		} else {
			return "redirect:detail?b_no=" + b_no;
		}
	}

}
