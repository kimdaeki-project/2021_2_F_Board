package com.kb.a1.member;

import static org.junit.jupiter.api.Assertions.*;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
@SpringBootTest
class MemberMapperTest {

	@Autowired
	private MemberMapper memberMapper;
	
	//약관 리스트 테스트
	//@Test
	void selectTermstest() throws Exception{
		List<TermsVO> list = memberMapper.selectTermsList();
		System.out.println("출력 : " + list);
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i).getTerms_title());
		}
		assertNotNull(list);
	}

	//날짜 테스트
	//@Test
	void dateTest() throws Exception{
		java.util.Date date = new java.util.Date();
		System.out.println(date);
	}
	
	//아이디 중복 체크
	//@Test
	void idChkTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_userid("master");
		System.out.println(memberVO.getMem_userid());
		int cnt = memberMapper.idCheck(memberVO.getMem_userid());
		assertNotEquals(0, cnt);
	}
	
	//닉네임 중복 체크
	//@Test
	void nickChkTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_nickname("마스터");
		System.out.println(memberVO.getMem_nickname());
		int cnt = memberMapper.nicknameCheck(memberVO.getMem_nickname());
		System.out.println(cnt);
		assertNotEquals(0, cnt);
	}
	
	//로그인 테스트
	//@Test
	void getLoginTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_userid("master");
		memberVO.setMem_userpw("master1");
		memberVO = memberMapper.getLogin(memberVO);
		System.out.println(memberVO);
		assertNotNull(memberVO);
	}
	
	//로그인 업데이트 테스트
	@Test
	void updateLoginTest() throws Exception{
		MemberVO memberVO = new MemberVO();
		memberVO.setMem_userid("master");
		int result = memberMapper.updateLogin(memberVO);
		System.out.println(result);
		assertNotEquals(0, result);
	}
	
	
}
