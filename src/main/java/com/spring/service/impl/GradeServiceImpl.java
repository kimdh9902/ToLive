package com.spring.service.impl;

import org.springframework.stereotype.Service;

import com.spring.domain.GradeVO;
import com.spring.mapper.GradeMapper;
import com.spring.service.GradeService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class GradeServiceImpl implements GradeService{
	
	private final GradeMapper mapper;
	
	@Override
	public GradeVO getGrade(String id) {
		return mapper.selectGrade(id);
	}

	@Override
	public int modifyGrade(int grade_level, String id) {
		return mapper.updateGrade(grade_level, id);
	}

}
