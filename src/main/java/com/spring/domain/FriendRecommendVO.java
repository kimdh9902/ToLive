package com.spring.domain;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class FriendRecommendVO {
	private ProfileVO friend;
	private List<String> following;
}
