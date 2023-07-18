package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class HashVO {
	private int hash_id;// 해쉬태그 아이디
	private String hash_tag;// 해쉬태그명
}
