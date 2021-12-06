package com.kb.a1.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	public List<TermsVO> selectTermsList() throws Exception{
		return memberMapper.selectTermsList();
	}
}
