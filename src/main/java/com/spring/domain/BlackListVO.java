package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class BlackListVO {
	private int blist_no;
	private String user_id;
	private String block_account;
}
