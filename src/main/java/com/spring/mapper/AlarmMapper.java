package com.spring.mapper;

import java.util.List;

import com.spring.domain.AlarmVO;

public interface AlarmMapper {
	
	public int insertAlarm(AlarmVO alarmVO);//알림 추가
	public void updateAlarm(int alarm_no);//알림 확인 후 is_open을 1로 변경
	public List<AlarmVO> selectAlarmById(String user_id);//알림 20개 출력
	public int selectIsOpenCount(String user_id);
}
