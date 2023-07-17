package com.spring.service;

import com.spring.domain.GradeVO;

public interface GradeService {
	public GradeVO getGrade(String id);
	public int modifyGrade(int grade_level, String id);
}
