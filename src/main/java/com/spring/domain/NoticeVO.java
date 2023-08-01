package com.spring.domain;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeVO {
	private String notice_contents;
	
	private String notice_date;
	
	private String end_date;
	
}
