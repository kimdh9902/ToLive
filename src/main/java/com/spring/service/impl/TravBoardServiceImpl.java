package com.spring.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
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
	public List<TravBoardVO> getTravBoardList(String user_id) {
		return mapper.selectTravBoardList(user_id);
	}

	@Override
	public TravBoardVO getBoard(int trav_b_no) {
		return mapper.selectOneBoard(trav_b_no);
	}

	@Override
	public int modifyTravBoardPlusView(int trav_b_no) {
		return mapper.updateTravBoardPlusView(trav_b_no);
	}

	@Override
	public List<TravBoardVO> getAllBoard(String user_id) {// 프로필
		return mapper.selectAllBoard(user_id);
	}

	@Override
	public boolean removeTravBoard(int trav_b_no) {
		return mapper.deleteTravBoard(trav_b_no);
	}

	@Override
	public void removeTravBoardById(String id) {
		mapper.deleteTravBoardById(id);
	}

	@Override
	public void removeImageById(String id) {
		mapper.deleteImageById(id);
	}

}
