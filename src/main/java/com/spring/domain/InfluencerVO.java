package com.spring.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.DATE;

@Getter
@Setter
@ToString
public class InfluencerVO {
	private int inf_no;
	private String user_id;
	private String req_date;
}
