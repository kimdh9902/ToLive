package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BoardCommentVO {
	private int c_no;
	private int b_no;
	private String user_id;
	private String contents;
}
