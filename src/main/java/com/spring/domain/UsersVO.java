package com.spring.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

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
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date birth;
	String phone;
	int location;
	int grade_level;
}
