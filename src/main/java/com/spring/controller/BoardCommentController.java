package com.spring.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.spring.domain.BoardCommentVO;
import com.spring.domain.EmojiVO;
import com.spring.service.BlackListService;
import com.spring.service.BoardCommentService;
import com.spring.service.EmojiService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/boardComment/*")
public class BoardCommentController {
	private final BoardCommentService commentService;
	private final EmojiService emojiService;
	private final BlackListService blackService;
	
	@GetMapping("/insert-comment")
	public void InsertComment(BoardCommentVO vo) {
		commentService.addComment(vo);
	}
	
	@GetMapping("/select-comments")
	public List<BoardCommentVO> SelectComments(int b_no){
		return commentService.getComments(b_no);
	}
	
	@GetMapping("/update-emoji")
	public void UpdateEmoji(EmojiVO vo) {
		if(emojiService.getEmoji(vo) == vo.getEmoji_record()) {
			vo.setEmoji_record(0);
			emojiService.alterEmoji(vo);
		}else {
			emojiService.alterEmoji(vo);
		}
	}
	
	
//	@GetMapping("/blacklist-add")
//	public void addBlackList(String user_id, String block_account) {
//		blackService.addBlackList(user_id, block_account);
//	}
//	
//	@GetMapping("/blacklist-get")
//	public String getBlackList(String user_id) {
//		blackService.getBlackList(user_id);
//		return "blacklist";
//	}
//	
//	@GetMapping("/blacklist-remove")
//	public void getBlackList(String user_id, String block_account) {
//		blackService.removeBlackList(user_id, block_account);
//	}
	
	@GetMapping("/blacklist")
	public void BlackList(String user_id, String block_account, String mode) {
		switch(mode) {
        case "add":
            blackService.addBlackList(user_id, block_account);
            break;
        case "get":
            blackService.getBlackList(user_id);
            break;
        case "remove":
            blackService.removeBlackList(user_id, block_account);
            break;
        default:
            System.out.println("???????????????????error???????????????????");
            break;
		}
    }
	
	@GetMapping("/grade")
	public void Grade(String mode) {
		int result = -1;
		switch(mode) {
        case "":
            result = 1;
            break;
        case "get":
        	result = 2;
            break;
        case "remove":
        	result = 3;
            break;
        default:
            System.out.println("################error################");
            break;
		}
    }
}
