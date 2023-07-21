package com.spring.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.AlarmVO;
import com.spring.domain.BoardCommentVO;
import com.spring.domain.FollowVO;
import com.spring.service.AlarmService;
import com.spring.service.BlackListService;
import com.spring.service.FollowService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RestController
@RequestMapping("/user/*")
@RequiredArgsConstructor
public class UserController {
	
	private final FollowService followService;
	private final AlarmService alarmService;
	
	@GetMapping(value = "/friend", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<String> friendList(HttpSession session){
		String id = (String)session.getAttribute("SESS_ID");
		List<String> result = followService.getfollowerNameList(id);
		
		
		return result;
	}
	
//	@GetMapping(value = "/onFollow", produces = {MediaType.APPLICATION_JSON_VALUE})
//	public boolean followCheck(String user_id, HttpSession session) {
//		boolean isFollow = false;
//		FollowVO vo = new FollowVO();
//		vo.setUser_id(user_id);
//		vo.setFollower_id((String)session.getAttribute("SESS_ID"));
//		isFollow = followService.isFollow(vo);
//		
//		return isFollow;
//	}
//	
	@PostMapping(value = "/onFollow", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean followCheck(@RequestBody FollowVO vo, HttpSession session) {
	    boolean isFollow;
	    vo.setFollower_id((String)session.getAttribute("SESS_ID"));
	    isFollow = followService.isFollow(vo);
	    if(isFollow) {
	    	followService.unFollow(vo);
	    }else {
	    	followService.follow(vo);
	    }
	    return isFollow;
	}
	
	@GetMapping(value = "/alarm", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<AlarmVO> getAlarm(String user_id) {
		List<AlarmVO> alList = alarmService.getAlarmByUser(user_id);
		return alList;
	}
	
	@GetMapping(value = "/is-alarm", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean getIsAlarm(String user_id) {
		return alarmService.getIsOpenCount(user_id);
	}
	
	@GetMapping(value = "/insertComments", produces = {MediaType.APPLICATION_JSON_VALUE})
	public void InputComments(BoardCommentVO vo, HttpSession session) {
//		vo.set
	}
	
}
