package com.kb.a1.member;

import java.sql.Blob;

import lombok.Data;

@Data
public class TermsVO {

	private int terms_code;
	private String terms_title;
	private String terms_content; //Blob으로 설정시 null이 나와서 String사용함
	private String terms_must;
}
