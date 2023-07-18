package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PartyBoardVO {
	int party_b_no;// 파티 모집 게시판 글 번호
	String title;// 제목
	String contents;//내용
	int now_people;// 파티 인원 사이즈
	int max_people;// 최대 인원 사이즈
	String user_id;// 사용자 아이디
	int is_hidden;// 글 숨김 여부

}
