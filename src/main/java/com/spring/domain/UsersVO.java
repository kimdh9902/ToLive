package com.spring.domain;

import java.io.Serializable;
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
public class UsersVO implements Serializable{
    private static final long serialVersionUID = 1L;
	String id;
	String pw;
	String name;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	Date birthday;
	String phone_number;
	int location_id;
	int grade_level;
}
