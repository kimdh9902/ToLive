package com.spring.domain;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProfileVO {
	String user_id;
	String user_name;
	String contents; // 자기소개
	int follower; // 팔로우 테이블
	int following; // 팔로우 테이블
	int board_count; // trav_board 테이블
}
