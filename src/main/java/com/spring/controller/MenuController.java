package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
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
import com.spring.domain.AlarmVO;
import com.spring.domain.FollowVO;
import com.spring.domain.PartyBoardVO;
import com.spring.domain.ProfileVO;
import com.spring.domain.SearchIdVO;
import com.spring.domain.StarBoardVO;
import com.spring.domain.TravBoardVO;
import com.spring.service.AlarmService;
import com.spring.service.FollowService;
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
	
	@GetMapping("/profile")
	public String profile(Model model, @RequestParam String user_id, HttpSession session) {
		boolean isSame = false;
		ProfileVO profileVO = profileService.getProfileByID(user_id);
		System.out.println("뭐라는거야 개같은거 : "+SecurityContextHolder.getContext().getAuthentication());
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		System.out.println(auth.getAuthorities());
		String sess_id = auth.getName();

		 
		if( sess_id.equals(profileVO.getUser_id() )) {
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
	
		return "findUser";
	}
	
	@PostMapping("/search")
	@ResponseBody
	public ResponseEntity<String> searchUser(Model model, @RequestBody Map<String, String> data) {
		log.info("user------"+data.get("user"));
		
		List<SearchIdVO> list = searchService.findByIdAndName(data.get("user"));
		System.out.println("list:" + list);
		
		Gson gson = new Gson(); // Gson 라이브러리를 이용해 JSON 형태로 변환
	    String jsonList = gson.toJson(list);
		
		return new ResponseEntity<String>(jsonList, HttpStatus.OK);
	}
	
	@GetMapping("/alarm")
	public String alarm(String id, @RequestParam int alarm_no, @RequestParam int b_no) {
		alaramService.openAlarm(alarm_no);
		return "redirect:/travBoard/travBoard-detail?b_no="+b_no;
	}
	
	@GetMapping("/starBoard")
	public String starBoard(Model model) {
		List<StarBoardVO> starList = starBoardService.getStarBoards();
		model.addAttribute("starList", starList);
		return "starBoard";
	}
	
	//파티 모집 게시판으로 이동
	@GetMapping("/partyBoard")
	public String selectAllPartyBoard(Model model){
		List<PartyBoardVO> partyBoardVO= partyBoardService.getPartyBoardList();
		model.addAttribute("partyBoardVO",partyBoardVO);
		return "partyBoard";		
	}
	
	//여행 후기글로 이동
	@GetMapping("/travBoard")
	public String selectTravBoardList(Model model, HttpSession session){
		List<TravBoardVO> travBoardList = travBoardService.getTravBoardList((String) session.getAttribute("SESS_ID"));
		model.addAttribute("travBoardList", travBoardList);
		return "travBoard";		
	}
	
	@GetMapping("/friendList")
	public String frined(Model model, HttpSession session) {
		List<String> result = followService.getFollowingNameList((String)session.getAttribute("SESS_ID"));
		model.addAttribute("friendList", result);
		return "friend";
	}
}
