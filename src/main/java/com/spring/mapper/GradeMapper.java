package com.spring.mapper;

import com.spring.domain.GradeVO;

public interface GradeMapper {
	public GradeVO selectGrade(String id);
	public int updateGrade(int grade_level, String id);
}
