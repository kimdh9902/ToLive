package com.spring.service;

import java.util.List;

import com.spring.domain.ReportVO;

public interface ReportService {
	
	public List<ReportVO> selectAllReportBoard();		//신고내역 보드
	public void addReportBoard(ReportVO vo);		//신고된 글 신고내역에 추가
	public void removeReportBoard(int b_no);					//신고 대처 후 신고내역에서 삭제
	public void reassignReportBoard(int b_no);					//신고 5스택시 글 숨김
	public void reassignReportPost(int b_no);						//무혐의 신고글 복구
}
