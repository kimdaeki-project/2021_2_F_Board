package com.kb.a1.member;

import java.util.Date;

import lombok.Data;

@Data
public class MemberVO {

	private Long mem_idx;
	private String mem_userid;
	private String mem_userpw;
	private String mem_username;
	private String mem_nickname;
	private String mem_gender;
	private String mem_email;
	private String mem_birth;
	private String mem_tel;
	private String mem_zipcode;
	private String mem_address_1;
	private String mem_address_2;
	private String mem_status;
	private String mem_cert;
	private int mem_auth;
	private String mem_regtime;
	private String mem_logtime;	//로그인 타임
	private String mem_pwtime;
	private String mem_droptime;
	private Long mem_logcount;	//로그인 회수
	private String mem_super;
}
