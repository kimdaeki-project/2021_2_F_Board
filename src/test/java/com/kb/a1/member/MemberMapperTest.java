package com.kb.a1.member;

import static org.junit.jupiter.api.Assertions.*;

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

}
