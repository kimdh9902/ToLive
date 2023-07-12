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
	
}
