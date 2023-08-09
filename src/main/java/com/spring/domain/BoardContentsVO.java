package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardContentsVO {
	private int b_no;			// 글번호 외래키
	private String contents;	// 글이면 글내용 이미지 혹은 뷰어면 경로
	private String type;		// text image viewer
	private int contents_no;	// div 넣어야 하는 컨텐츠의 순서 ?? 컨트롤러에서 받기 ??
}
