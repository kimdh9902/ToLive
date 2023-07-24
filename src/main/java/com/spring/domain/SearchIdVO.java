package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class SearchIdVO {
	private String user_id;
	private String user_name;
	private String profile_img; 
}