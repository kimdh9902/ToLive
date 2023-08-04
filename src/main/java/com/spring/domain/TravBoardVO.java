package com.spring.domain;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TravBoardVO {
	private int trav_b_no;// 여행 후기글 번호
	private int b_no;// 글 번호
	private String title;// 제목
	private String contents;// 내용
	private String user_id;// 작성자
	private Date reg_date;// 작성일
	private int total_emoji;// 공감
	private int views;// 조회수
	private int is_hidden;// 숨김여부
	private int grade_level;// 권한 등급
	private String follower_id;// 팔로워 아이디

	// 이미지 추가
	private List<BoardImageVO> imgPathList;

}
