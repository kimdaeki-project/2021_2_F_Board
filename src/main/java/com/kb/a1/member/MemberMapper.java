package com.kb.a1.member;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
//@Repository
@Mapper
public interface MemberMapper {

	//약관 목록 리스트 출력
	public List<TermsVO> selectTermsList() throws Exception;
	
	// 아이디 중복 체크
	public int idCheck(String mem_userid) throws Exception;

	// 닉네임 중복 체크
	public int nicknameCheck(String mem_nickname) throws Exception;

	// 로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
	// 로그인 업데이트 접속시간, 접속회수
	public int updateLogin(MemberVO memberVO) throws Exception;

	// 회원정보 목록
	public List<MemberVO> selectMemberList()throws Exception;
	
	// 회원 insert
	public int insertMember(MemberVO memberVO)throws Exception;
	
	// 약관 insert
	public int insertTermsLog(TermsLogVO termsLogVO)throws Exception;

	//계정 삭제
	public int deleteMember(MemberVO memberVO)throws Exception;
	
	// 약관동의 select
	public TermsLogVO selectTerm(TermsLogVO termsLogVO)throws Exception;

	// 약관동의 update
	public int updateTerms(TermsLogVO termsLogVO)throws Exception;
	
	// 회원정보  selectUpdate
	public MemberVO selectUpdate(MemberVO memberVO)throws Exception;
}
