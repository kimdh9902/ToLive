package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.ReportVO;
import com.spring.mapper.ReportMapper;
import com.spring.service.ReportService;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class ReportServiceImpl implements ReportService{

	private final ReportMapper mapper;
	
	@Override
	public List<ReportVO> selectAllReportBoard() {
		return mapper.selectAllReportBoard();
	}

	@Override
	public void addReportBoard(ReportVO vo) {
		mapper.insertReportBoard(vo);
	}

	@Override
	public void removeReportBoard(int b_no) {
		mapper.deleteReportBoard(b_no);
	}

	@Override
	public void reassignReportBoard(int b_no) {
		mapper.updateReportBoard(b_no);
	}

	@Override
	public void reassignReportPost(int b_no) {
		mapper.updateReportPost(b_no);
	}

	@Override
	public void removeReportById(String reported_id) {
		mapper.deleteReportById(reported_id);
	}

}
