package com.spring.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.spring.domain.AlarmVO;
import com.spring.domain.BoardCommentVO;
import com.spring.domain.FollowVO;
import com.spring.domain.TravBoardVO;
import com.spring.service.AlarmService;
import com.spring.service.BlackListService;
import com.spring.service.BoardCommentService;
import com.spring.service.FollowService;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@RestController
@RequestMapping("/user/*")
@RequiredArgsConstructor
public class UserController {
	
	private final FollowService followService;
	private final AlarmService alarmService;
	private final BoardCommentService commentService;
	
	@GetMapping(value = "/friend", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<String> friendList(HttpSession session){
		String id = (String)session.getAttribute("SESS_ID");
		List<String> result = followService.getfollowerNameList(id);
		
		
		return result;
	}
	
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
	
	@PostMapping(value = "/send-alarm", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean sendAlarm(@RequestBody AlarmVO vo) {
		boolean temp = alarmService.sendAlarm(vo);
		return temp;
	}
	
	@GetMapping(value = "/is-alarm", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean getIsAlarm(String user_id) {
		return alarmService.getIsOpenCount(user_id);
	}
	
	@GetMapping(value = "/checkSession", produces = {MediaType.APPLICATION_JSON_VALUE})
	public boolean checkSession(HttpServletRequest request) {
		if(request.getSession(false) == null)
			return false;
		return true;
	}
	
	@GetMapping(value = "/insertComment")
	public void InputComment(BoardCommentVO vo, HttpSession session) {
		commentService.addComment(vo);
	}
	
	@GetMapping(value = "/selectComments", produces = {MediaType.APPLICATION_JSON_VALUE})
	public List<BoardCommentVO> getComments(int b_no){
		System.out.println("들왔음###############################");
		List<BoardCommentVO> boardCommentList = commentService.getComments(b_no);
		System.out.println("무조건의 그숙명");
		System.out.println(boardCommentList);
		return boardCommentList;
		
	}
	
	@GetMapping("/deleteComment")
	public void DeleteComment(int c_no) {
		commentService.removeComment(c_no);
		System.out.println("좀 먹어라");
		System.out.println(c_no);
	}
	
	@PostMapping("/updateComment")
	public int UpdateComment(@RequestBody BoardCommentVO vo) {
		System.out.println("좀 먹어라 수정");
		return commentService.alterComment(vo);
	}
}
