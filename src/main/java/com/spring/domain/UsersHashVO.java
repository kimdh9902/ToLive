package com.spring.domain;

import java.util.List;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.Setter;


@Getter
@Setter
public class UsersHashVO extends UsersVO{
	private List<String> hashList;
}
