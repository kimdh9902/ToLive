package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.AlarmVO;
import com.spring.mapper.AlarmMapper;
import com.spring.service.AlarmService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class AlarmServiceImpl implements AlarmService{

	private final AlarmMapper mapper;
	
	@Override
	public void sendAlarm(AlarmVO alarmVO) {
		mapper.insertAlarm(alarmVO);
	}

	@Override
	public void openAlarm(int alarm_no) {
		mapper.updateAlarm(alarm_no);
	}

	@Override
	public List<AlarmVO> getAlarmByUser(String user_id) {
		return mapper.select10Alarm(user_id);
	}

	@Override
	public boolean getIsOpenCount(String user_id) {
		boolean result;
		if(mapper.selectIsOpenCount(user_id) > 0) {
			result = true;
		}else {
			result = false;
		}
		return result;
	}
	
}
