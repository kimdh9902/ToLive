package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.TravBoardVO;
import com.spring.mapper.TravBoardMapper;
import com.spring.service.TravBoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class TravBoardServiceImpl implements TravBoardService {

	private final TravBoardMapper mapper;

	@Override
	public int registerTravBoard(String title, String contents, String user_id) {
		return mapper.insertTravBoard(title, contents, user_id);
	}

	@Override
	public List<TravBoardVO> getTravBoardList() {
		return mapper.selectTravBoardList();
	}

	@Override
	public TravBoardVO getBoard(int trav_b_no) {
		return mapper.selectBoard(trav_b_no);
	}

	@Override
	public int modifyTravBoard(TravBoardVO vo) {
		return mapper.updateTravBoard(vo);
	}

	@Override
	public int modifyTravBoardByIsHidden(int trav_b_no) {
		return mapper.updateTravBoardByIsHidden(trav_b_no);
	}

	@Override
	public int modifyTravBoardToPublic(int trav_b_no) {
		return mapper.updateTravBoardToPublic(trav_b_no);
	}

	@Override
	public int modifyTravBoardPlusView(int trav_b_no) {
		return mapper.updateTravBoardPlusView(trav_b_no);
	}

	@Override
	public boolean removeTravBoard(int trav_b_no) {
		return mapper.deleteTravBoard(trav_b_no);
	}

	@Override
	public List<TravBoardVO> getAllBoard(String user_id) {
		return mapper.selectAllBoard(user_id);
	}

}
