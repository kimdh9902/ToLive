package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private int b_no;// 글 번호
	private String title;// 제목	
	private String contents;// 내용
	private String user_id;// 작성자
	private Date reg_date;//작성일  
	private int is_hidden;// 숨김여부
}
