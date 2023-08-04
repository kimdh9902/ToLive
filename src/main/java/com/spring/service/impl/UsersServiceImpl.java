package com.spring.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.domain.GradeVO;
import com.spring.domain.UsersVO;
import com.spring.mapper.UsersMapper;
import com.spring.service.AlarmService;
import com.spring.service.BlackListService;
import com.spring.service.BoardCommentService;
import com.spring.service.BoardHashService;
import com.spring.service.BoardService;
import com.spring.service.EmojiService;
import com.spring.service.FollowService;
import com.spring.service.InfluencerService;
import com.spring.service.PartyBoardService;
import com.spring.service.ProfileService;
import com.spring.service.ReportService;
import com.spring.service.StarBoardService;
import com.spring.service.TravBoardService;
import com.spring.service.UsersService;

import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Service
@RequiredArgsConstructor
public class UsersServiceImpl implements UsersService{
	
	private final UsersMapper mapper;
	private final InfluencerService influencerService;
	private final ProfileService profileService;
	private final BoardCommentService boardCommentService;
	private final AlarmService alarmService;
	private final StarBoardService starBoardService;
	private final BoardHashService boardHashService;
	private final ReportService reportService;
	private final BlackListService blackListService;
	private final TravBoardService travBoardService;
	private final EmojiService emojiService;
	private final PartyBoardService partyBoardService;
	private final BoardService boardService;
	private final FollowService followService;
	
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

	@Override
	public List<UsersVO> getAllUsers() {
		return mapper.selectAllUsers();
	}
	
	
	
	
	@Override
	public int removeUsersAccount(String id) {
		influencerService.removeInfluencer(id);
		boardCommentService.removeUsersComment(id);
		alarmService.removeAlarmById(id);
		starBoardService.removeStarBoardById(id);
		boardHashService.removeUHCById(id);
		boardHashService.removeBHById(id);
		reportService.removeReportById(id);
		blackListService.removeBlackListById(id);
		travBoardService.removeImageById(id);
		profileService.removeProfile(id);
		emojiService.removeEmoji(id);
		travBoardService.removeTravBoardById(id);
		partyBoardService.removePartyBoardById(id);
		boardService.removeBoardById(id);
		boardHashService.removeUHById(id);
		followService.removeFollowById(id);
		return mapper.deleteUsersAccount(id);
	}

	@Override
	public int registerUsersGradeZero(String id) {
		return mapper.updateUsersGradeZero(id);
	}

	@Override
	public int modifyUsersGradeZero(String id) {
		return mapper.updateUsersGradeZero(id);
	}

	@Override
	public int changeUserGrade(UsersVO vo) {
		return mapper.changeUserGrade(vo);
	}
	
	

}
