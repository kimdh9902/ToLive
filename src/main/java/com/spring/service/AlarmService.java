package com.spring.service;

import java.util.List;

import com.spring.domain.AlarmVO;


public interface AlarmService {
	public void sendAlarm(AlarmVO alarmVO);//알림 추가
	public void openAlarm(int alarm_no);//알림 확인 후 is_open을 1로 변경
	public List<AlarmVO> getAlarmByUser(String user_id);//알림 20개 출력
}
