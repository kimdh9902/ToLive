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
	private String reported_id;
	private int report_num;
	private String report_comment;
}
