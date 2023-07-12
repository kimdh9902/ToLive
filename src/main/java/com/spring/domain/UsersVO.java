package com.spring.domain;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class UsersVO {
	String id;
	String pw;
	String name;
	Date birth;
	String phone;
	int location;
	int grade_level;
}
