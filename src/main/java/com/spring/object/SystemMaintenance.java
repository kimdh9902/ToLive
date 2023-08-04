package com.spring.object;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.spring.service.NoticeService;
import com.spring.service.StarBoardService;


@Component
public class SystemMaintenance {
	
	private final NoticeService noticeService;
	private final StarBoardService starService;
	
	public SystemMaintenance(
		@Autowired NoticeService noticeService,
	    @Autowired StarBoardService starService
	) {
		this.noticeService = noticeService;
		this.starService = starService;
	}
	
	//매월 1일 end_date가 지난 공지 삭제
	@Scheduled(cron = "0 0 0 1 * ?")//순서대로 초,분,시,일,월,요일 초기화 기준 정해줌
	public void deleteNotice(){
	    noticeService.removeNotice();
	}
	
	//매월 1일 명예의 전당 글 선정하여 insert
	@Scheduled(cron = "0 0 0 5 * ?")
	public void insertStar(){
		starService.setStarBoard();
	}
}
