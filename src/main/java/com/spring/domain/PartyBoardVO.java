package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PartyBoardVO {
	private int party_b_no;// 파티 모집 게시판 글 번호
	private int b_no;//글 번호
	private String title;// 제목
	private String contents;//내용
	private int now_people;// 현재 모집된 인원
	private int max_people;// 최대 인원 사이즈
	private String user_id;// 작성자
	private Date reg_date;//작성일  
	private int is_hidden;// 글 숨김 여부

}
