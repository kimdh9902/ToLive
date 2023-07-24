package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AlarmVO {
	int alarm_no;
	String user_id;
	String profile_img;
	int b_no;
	String msg;
	int is_open;
}
