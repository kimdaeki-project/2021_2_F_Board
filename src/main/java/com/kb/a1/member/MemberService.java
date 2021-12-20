package com.kb.a1.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	public List<TermsVO> selectTermsList() throws Exception{
		return memberMapper.selectTermsList();
	}
	
	//아이디 중복 체크
	public int idCheck(String mem_userid) throws Exception {
		int cnt = memberMapper.idCheck(mem_userid);
		return cnt;
	}
	
	//닉네임 중복 체크
	public int nicknameCheck(String mem_nickname) throws Exception {
		int nickcnt = memberMapper.nicknameCheck(mem_nickname);
		return nickcnt;
	}
	
	//로그인
	public MemberVO getLogin(MemberVO memberVO) throws Exception {
		return memberMapper.getLogin(memberVO);
	}
	
	//로그인 정보 업데이트
	public int updateLogin(MemberVO memberVO) throws Exception{
		return memberMapper.updateLogin(memberVO);
	}
	
	//회원정보 목록
	public List<MemberVO> selectMembers()throws Exception{
		return memberMapper.selectMemberList();
	}
	
	// 회원 insert
	public int insertMember(MemberVO memberVO)throws Exception{
		return memberMapper.insertMember(memberVO);
	}
	
	// 약관 insert
	public int insertTermsLog(TermsLogVO termsLogVO)throws Exception{
		return memberMapper.insertTermsLog(termsLogVO);
	}
	
	//계정 삭제
	public int deleteMember(MemberVO memberVO)throws Exception{
		return memberMapper.deleteMember(memberVO);
	}
	
	// 약관동의 select
	public TermsLogVO selectTerm(TermsLogVO termsLogVO)throws Exception{
		return memberMapper.selectTerm(termsLogVO);
	}
	// 약관동의 update
	public int updateTerms(TermsLogVO termsLogVO)throws Exception{
		return memberMapper.updateTerms(termsLogVO);
	}
	// 회원정보  selectUpdate
	public MemberVO selectUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.selectUpdate(memberVO);
	}
	
}
