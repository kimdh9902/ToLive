package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TravBoardVO {
	int trav_b_no; // 여행 후기글 글 번호
	String title;// 제목
	String contents;// 내용
	String user_id;// 사용자 아이디
	int views;// 조회수
	String Hash_tag;//해쉬태그명 (join)
	int hash_id;//해쉬태그 아이디 (join)
	int is_hidden;// 글 숨김 여부
}
