package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.spring.domain.FollowVO;
import com.spring.domain.NoticeVO;
import com.spring.domain.PartyBoardVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;
import com.spring.domain.StarBoardVO;
import com.spring.domain.TravBoardVO;
import com.spring.domain.UsersVO;
import com.spring.object.CustomUserDetails;
import com.spring.service.AlarmService;
import com.spring.service.FollowService;
import com.spring.service.NoticeService;
import com.spring.service.PartyBoardService;
import com.spring.service.ProfileService;
import com.spring.service.SearchService;
import com.spring.service.StarBoardService;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
@Log4j
@RequestMapping("/menu/*")
public class MenuController {
	private final ProfileService profileService;
	private final SearchService searchService;
	private final AlarmService alaramService;
	private final PartyBoardService partyBoardService;
	private final FollowService followService;
	private final TravBoardService travBoardService;
	private final StarBoardService starBoardService;
	private final NoticeService noticeService;

	@GetMapping("/profile")
	public String profile(Model model, @RequestParam String user_id, HttpSession session) {
		boolean isSame = false;
		ProfileVO profileVO = profileService.getProfileByID(user_id);
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Object principal = authentication.getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails) principal;
		UsersVO user = userDetails.getUserVO();
		String sess_id = user.getId();

		if (sess_id.equals(profileVO.getUser_id())) {
			isSame = true;
		}
		model.addAttribute("path", profileVO.getProfile_img());
		model.addAttribute("isSame", isSame);
		model.addAttribute("profileVO", profileVO);
		FollowVO vo = new FollowVO();
		vo.setUser_id(user_id);
		vo.setFollower_id(sess_id);
		model.addAttribute("isFollow", followService.isFollow(vo));
		return "profile";
	}

	@GetMapping("/findUser")
	public String search(Model model) {
		NoticeVO notice = noticeService.getNotice();
		model.addAttribute("noticeVO", notice);
		return "findUser";
	}

	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<String> searchUser(Model model, @RequestBody Map<String, String> data) {
		log.info("user------" + data.get("user"));

		List<SearchIdVO> list = searchService.findByIdAndName(data.get("user"));
		System.out.println("list:" + list);

		Gson gson = new Gson(); // Gson 라이브러리를 이용해 JSON 형태로 변환
		String jsonList = gson.toJson(list);

		return new ResponseEntity<String>(jsonList, HttpStatus.OK);
	}

	@GetMapping("/alarm")
	public String alarm(String id, @RequestParam int alarm_no, @RequestParam int b_no) {
		alaramService.openAlarm(alarm_no);
		return "redirect:/travBoard/travBoard-detail?b_no=" + b_no;
	}

	@GetMapping("/starBoard")
	public String starBoard(Model model) {
		List<StarBoardVO> starList = starBoardService.getStarBoards();
		model.addAttribute("starList", starList);
		return "starBoard";
	}

	// 파티 모집 게시판으로 이동
	@GetMapping("/partyBoard")
	public String selectAllPartyBoard(Model model) {
		List<PartyBoardVO> partyBoardVO = partyBoardService.getPartyBoardList();
		NoticeVO notice = noticeService.getNotice();
		model.addAttribute("partyBoardVO", partyBoardVO);
		model.addAttribute("noticeVO", notice);
		return "partyBoard";
	}

	// 여행 후기글로 이동
	@GetMapping("/travBoard")
	public String selectTravBoardList(Model model, HttpSession session) {
		NoticeVO notice = noticeService.getNotice();

		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Object principal = authentication.getPrincipal();
		CustomUserDetails userDetails = (CustomUserDetails) principal;
		UsersVO user = userDetails.getUserVO();
		String sess_id = user.getId();
		List<TravBoardVO> travBoardList = travBoardService.getTravBoardList(sess_id);
		model.addAttribute("travBoardList", travBoardList);
		model.addAttribute("noticeVO", notice);
		return "travBoard";
	}

	@GetMapping("/friendList")
	public String frined(Model model, HttpSession session) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Object principal = authentication.getPrincipal();
		UsersVO uvo = null;
		NoticeVO notice = noticeService.getNotice();
		if (principal instanceof CustomUserDetails) {
			CustomUserDetails userDetails = (CustomUserDetails) principal;
			uvo = userDetails.getUserVO();
			List<String> result = followService.getFollowingNameList(userDetails.getUserVO().getId());
			model.addAttribute("friendList", result);
		}
		model.addAttribute("noticeVO", notice);
		return "friend";
	}
}
