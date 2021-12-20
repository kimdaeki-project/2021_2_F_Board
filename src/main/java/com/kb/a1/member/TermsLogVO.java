package com.kb.a1.member;

import java.sql.Date;

import lombok.Data;

@Data
public class TermsLogVO {

	private String tlog_userid;
	private String tlog_check_1;
	private String tlog_check_2;
	private String tlog_check_3;
	private String tlog_check_4;
	private Date tlog_date;
}
