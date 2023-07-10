package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ReportVO {
	private int report_no;
	private int b_no;
	private String title;
	private String contents;
	private String report_user_id;
	private String report_comment;
}
