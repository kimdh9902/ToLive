package com.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.UsersMapper;
import com.spring.service.ProfileService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService{

	private final UsersMapper mapper;
	private final ProfileService profileService;
	
	@Override
	public int registerAccount(UsersVO vo) {
		System.out.println("ori:" + vo.getPw());
//		vo.setPw(passwordEncoderUtil.passwordEncoder().encode(vo.getPw()));
		System.out.println("encode:" +vo.getPw());
		int result = mapper.insertAccount(vo);
		if(result > 0) {
			profileService.makeProfile(vo.getId());
		}
		return result;
	}

	@Override
	public UsersVO checkAccount(UsersVO vo) {
		return mapper.selectAccount(vo);
	}

	@Override
	public boolean isIdCheck(String id) {
		int result = mapper.selectByIdCount(id);
		if(result > 0) {
			return true;
		}
		return false;
	}

	@Override
	public UsersVO findById(String id) {
		System.out.println("FIND!!!!!!! : " + mapper.selectAccountById(id));
		return mapper.selectAccountById(id);
	}

	@Override
	public GradeVO getAccountAuthorities(String id) {
		return mapper.selectGradeById(id);
	}

}
