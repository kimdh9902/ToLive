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
	public int registerPartyBoard(PartyBoardVO vo) {
		return mapper.insertPartyBoard(vo);
	}

	@Override
	public List<PartyBoardVO> getPartyBoardList() {
		return mapper.selectPartyBoardList();
	}

	@Override
	public PartyBoardVO getOnePartyBoard(int party_b_no) {
		return mapper.selectOnePartyBoard(party_b_no);
	}

	@Override
	public List<PartyBoardVO> getPartyBoardById(String user_id) {
		return mapper.selectPartyBoardById(user_id);
	}

	@Override
	public int modifyPartyBoard(PartyBoardVO vo) {
		return mapper.updatePartyBoard(vo);
	}

	@Override
	public int modifyPartyBoardPlusMember(int party_b_no) {
		return mapper.updatePartyBoardPlusMember(party_b_no);
	}

	@Override
	public boolean removePartyBoard(int party_b_no) {
		return mapper.deletePartyBoard(party_b_no);
	}

	@Override
	public int removePartyBoardWhenRecruitComplete(PartyBoardVO vo) {
		return mapper.deletePartyBoardWhenRecruitComplete(vo);
	}

	@Override
	public void removePartyBoardById(String user_id) {
		mapper.deletePartyBoardById(user_id);
	}

}
