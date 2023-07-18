package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.PartyBoardVO;
import com.spring.mapper.PartyBoardMapper;
import com.spring.service.PartyBoardService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class PartyBoardServiceImpl implements PartyBoardService {

	private final PartyBoardMapper mapper;

	@Override
	public int registerPartyBoard(String title, int max_people, String user_id) {
		return mapper.insertPartyBoard(title, max_people, user_id);
	}

	@Override
	public List<PartyBoardVO> getAllPartyBoard() {
		return mapper.selectAllPartyBoard();
	}

	@Override
	public PartyBoardVO getPartyBoardByPartyBNo(int party_b_no) {
		return mapper.selectPartyBoardByPartyBNo(party_b_no);
	}

	@Override
	public List<PartyBoardVO> getPartyBoardById(String user_id) {
		return mapper.selectPartyBoardById(user_id);
	}

	@Override
	public int modifyPartyBoard(String title, int max_people, int party_b_no) {
		return mapper.updatePartyBoard(title, max_people, party_b_no);
	}

	@Override
	public int modifyPartyBoardPlusMember(int party_b_no) {
		return mapper.updatePartyBoardPlusMember(party_b_no);
	}

	@Override
	public int removePartyBoard(int party_b_no) {
		return mapper.deletePartyBoard(party_b_no);
	}

	@Override
	public int removePartyBoardWhenRecruitComplete(PartyBoardVO vo) {
		return mapper.deletePartyBoardWhenRecruitComplete(vo);
	}

}
