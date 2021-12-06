package com.kb.a1.member;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
//@Repository
@Mapper
public interface MemberMapper {

	//약관 목록 리스트 출력
	public List<TermsVO> selectTermsList() throws Exception;

}
