package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardImageVO {
	private int img_no;// 이미지 번호
	private String img_path;// 이미지 번호
	private int b_no;// 글 번호

}
