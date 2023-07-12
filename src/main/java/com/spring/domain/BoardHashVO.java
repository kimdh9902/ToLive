package com.spring.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardHashVO {
	int b_h_no;//후기글 해쉬태그 글 번호
	int b_no;//후기글 번호
	String title; //제목
	String contents;//내용
	int hash_id;//해쉬태그 아이디
	List<String> hash_tag;//해쉬태그 명
	String user_id;//사용자 아이디
	int views;//조회수
}
