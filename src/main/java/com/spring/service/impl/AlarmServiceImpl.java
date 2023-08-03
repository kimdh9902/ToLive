package com.spring.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;

import com.spring.domain.AlarmVO;
import com.spring.mapper.AlarmMapper;
import com.spring.service.AlarmService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class AlarmServiceImpl implements AlarmService{

	private final AlarmMapper mapper;
	
	@Override
	public boolean sendAlarm(AlarmVO alarmVO) {
		boolean temp;
		if(mapper.insertAlarm(alarmVO) > 0) {
			temp = true;	
		}
		else {
			temp = false;
		}
		return temp;
	}

	@Override
	public void openAlarm(int alarm_no) {
		mapper.updateAlarm(alarm_no);
	}

	@Override
	public List<AlarmVO> getAlarmByUser(String user_id) {
		List<AlarmVO> list = mapper.selectAlarmById(user_id);
		return list;
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

	@Override
	public void removeAlarmById(String user_id) {
		mapper.deleteAlarmById(user_id);
	}
	
}
