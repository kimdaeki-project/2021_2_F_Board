package com.kb.a1.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import org.apache.logging.log4j.Logger;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kb.a1.util.SessionCheck;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(MemberController.class);
	
	//로그인 페이지
	@GetMapping("login")
	public ModelAndView login(HttpSession session)throws Exception{
		logger.info("=====로그인 페이지 이동=====");
		ModelAndView mv = new ModelAndView();
    	
    	//세션 검증
    	if(session.getAttribute("userid")==null){		
    		logger.info("세션 id : "+null);
    		mv.setViewName("member/login"); 		
    	}else {
    		//로그인 된 상태라면 로그아웃처리
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		logger.info("세션에 값이 발견되어 로그아웃 처리합니다.");
    		session.invalidate();
    		mv.setViewName("redirect:../"); 
    	}
    	
    
    	return mv;	
	}
	
	//로그인 ajax
	@PostMapping("login")
	public @ResponseBody String getLogin(@RequestBody String paramData
			, HttpSession session
			, HttpServletRequest request) throws Exception{
		logger.info("=====로그인 체크=====");
		System.out.println("파라미터 값 : "+paramData);
		JSONParser parser = new JSONParser();
		String result = "0";	//로그인 성공 여부
		Object obj = parser.parse( paramData );
		JSONObject jsonObj = (JSONObject) obj;
		String id = (String) jsonObj.get("ID");
		String pw = (String) jsonObj.get("PW");
		
		MemberVO memberVO = new MemberVO();		
		ModelAndView mv = new ModelAndView();
		
		memberVO.setMem_userid(id);
		memberVO.setMem_userpw(pw);
		memberVO = memberService.getLogin(memberVO);
		System.out.println(memberVO);
		if(memberVO != null) {
			//로그인 성공
			logger.info("로그인 SUCCESS");

			//접속시간, 접속회수 update
			memberService.updateLogin(memberVO);
			memberVO.setMem_userpw(pw);	//select문을 다시 호출하기위해 넣음
			memberVO = memberService.getLogin(memberVO);//업데이트 반영된 셀렉트문 호출
			System.out.println(memberVO);
			//세션 저장 아이디, 닉네임, 인증유무, 인가레벨, 최종 로그인 시간, 접속회수, 운영자 유무
			//HttpSession Session = request.getSession(false);			
			//request.getSession(false).setAttribute("super2", memberVO.getMem_super());
			session.setAttribute("member", memberVO);
			session.setAttribute("userid", memberVO.getMem_userid());
			session.setAttribute("nickname", memberVO.getMem_nickname());
			session.setAttribute("cert", memberVO.getMem_cert());
			session.setAttribute("auth", memberVO.getMem_auth());
			session.setAttribute("logtime", memberVO.getMem_logtime());	//date타입?
			session.setAttribute("logcount", memberVO.getMem_logcount()); 
			session.setAttribute("master", memberVO.getMem_super());
			//키값으로 "super"를 넣으면 jstl에서 인식 못함 
			

			//관리자 여부
			if(memberVO.getMem_super().toString().equals("Y")) {
				logger.info("관리자 계정");
				result = "2";
			}else {
				logger.info("일반 계정");
				result = "1";
			}
		//로그인 실패
		}else{
			logger.info("로그인 FAILED");
			result = "0";
		}
		logger.info("Result:" + result);
		return result;
	}
	
	//로그아웃
	@GetMapping("logout")
	public ModelAndView logout (HttpSession session) throws Exception{

		session.invalidate();
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:../");
		return mv;
	}
	
	//회원가입 1 - 약관
	@GetMapping("join")
	public ModelAndView join()throws Exception{
		logger.info("=====회원가입=====");
		ModelAndView mv = new ModelAndView();
		
		List<TermsVO> list = memberService.selectTermsList();
		mv.setViewName("member/joinCheck");
		//약관내용 출력
		mv.addObject("content_0", list.get(0).getTerms_content());
		mv.addObject("content_1", list.get(1).getTerms_content());
		mv.addObject("content_2", list.get(2).getTerms_content());
		mv.addObject("content_3", list.get(3).getTerms_content());
		
		return mv;
	}
	
	//회원가입 2 - 회원정보 입력
	@PostMapping("join")
	public ModelAndView join(TermsLogVO termsLogVO)throws Exception{
		logger.info("=====회원가입 약관제출=====");
		ModelAndView mv = new ModelAndView();
		//약관 페이지에서 전달 받은 파라미터들
		logger.info(termsLogVO.getTlog_check_1());
		logger.info(termsLogVO.getTlog_check_2());
		logger.info(termsLogVO.getTlog_check_3());
		logger.info(termsLogVO.getTlog_check_4());
		mv.addObject("vo_1", termsLogVO.getTlog_check_1());
		mv.addObject("vo_2", termsLogVO.getTlog_check_2());
		mv.addObject("vo_3", termsLogVO.getTlog_check_3());
		mv.addObject("vo_4", termsLogVO.getTlog_check_4());
		mv.setViewName("member/joinForm");
		return mv;
	}
	
	 // 아이디 중복 체크 ajax
    @PostMapping("idCheck")
    @ResponseBody
    public int idCheck(@RequestParam("mem_userid") String mem_userid) throws Exception{
        logger.info("userIdCheck 진입");
        logger.info("전달받은 id:"+mem_userid);
        int cnt = memberService.idCheck(mem_userid);
        logger.info("확인 결과:"+cnt);
        return cnt;
    }
    // 닉네임 중복 체크 ajax
    @PostMapping("nicknameCheck")
    @ResponseBody
    public int nicknameCheck(@RequestParam("mem_nickname") String mem_nickname) throws Exception{
        logger.info("nicknameCheck 진입");
        logger.info("전달받은 닉네임:"+mem_nickname);
        int nickcnt = memberService.nicknameCheck(mem_nickname);
        logger.info("확인 결과:"+nickcnt);
        return nickcnt;
    }
	
    //회원가입 submit 제출
    @PostMapping("join.do")
	public ModelAndView joinSubmit(TermsLogVO termsLogVO, MemberVO memberVO)throws Exception{
		logger.info("=====회원가입 SUBMIT=====");
		Map<String, Object> map = new HashMap<String, Object>();
		ModelAndView mv = new ModelAndView();
		//약관 페이지에서 전달 받은 파라미터들
		System.out.println(termsLogVO);
		System.out.println(memberVO);
		//전송 데이터 검증
		if(memberVO!=null||termsLogVO!=null) {
			//insert문
			int result = memberService.insertMember(memberVO);
			
			if(result==1) {
				String userid = memberVO.getMem_userid();
				logger.info("회원 INSERT SUCCESS");
				logger.info("id 파라미터 : "+userid);
				termsLogVO.setTlog_userid(userid);
				memberService.insertTermsLog(termsLogVO);
				mv.setViewName("member/joinSubmit");
			}else {
				logger.info("회원 INSERT FAILED");
			}
		}else {
			logger.info("실패: 회원VO 또는 약관VO에 데이터가 없습니다");
		}
		
		
		return mv;
	}
    
    //관리자 전용 페이지
    @GetMapping("master")
    public ModelAndView goMaster(HttpSession session) throws Exception{
    	logger.info("=====관리자 페이지=====");
    	String masterChk = (String)session.getAttribute("master");
    	ModelAndView mv = new ModelAndView();
    	if(masterChk.equals("Y")) {
    		logger.info("관리자 체크 : "+masterChk);
    		logger.info("관리자 페이지로 이동");
    		//회원목록 가져오기
    		List<MemberVO> list = memberService.selectMembers();
    		mv.addObject("list", list);  		
    		mv.setViewName("member/master");
    		return mv;
    	}else {
    		logger.info("관리자 체크 : "+masterChk);
    		logger.info("관리자가 아닙니다.");
    		session.invalidate();
    		mv.setViewName("redirect:../");
    	}   	
    	return mv;
    }
    
    
    
    
    
    //마이페이지
    @GetMapping("mypage")
    public ModelAndView goMypage(HttpSession session) throws Exception{
    	logger.info("=====마이 페이지=====");
    	ModelAndView mv = new ModelAndView();
    	
    	//세션 검증
    	if(session.getAttribute("userid")!=null){		
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		mv.setViewName("member/mypage"); 		
    	}else {
    		logger.info("세션 id : "+null);
    		mv.setViewName("redirect:../"); 
    	}
    	return mv;	
    }
    
    
    //회원탈퇴
    @GetMapping("delete")
    public ModelAndView delete(HttpSession session) throws Exception{
    	logger.info("=====계정 삭제=====");
    	ModelAndView mv = new ModelAndView();
    	
    	//세션 검증
    	if(session.getAttribute("userid")!=null){		
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		
    		//계정삭제
    		MemberVO memberVO = new MemberVO();
    		memberVO.setMem_userid((String)session.getAttribute("userid"));
    		memberService.deleteMember(memberVO);
    		logger.info("삭제완료");
    		session.invalidate();
    		mv.setViewName("redirect:../"); 		
    	}else {
    		logger.info("세션 id : "+null);
    		logger.info("삭제실패: 세션정보 없음");
    		mv.setViewName("redirect:../"); 
    	}
    	return mv;	
    }
    
    
    
    //약관동의 수정 페이지
    @GetMapping("terms")
    public ModelAndView goTerms(HttpSession session) throws Exception{
    	logger.info("=====약관동의 수정 페이지=====");
    	ModelAndView mv = new ModelAndView();
    	
    	//세션 검증
    	if(session.getAttribute("userid")!=null){		
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		List<TermsVO> list = memberService.selectTermsList();
    		//약관내용 출력
    		mv.addObject("content_0", list.get(0).getTerms_content());
    		mv.addObject("content_1", list.get(1).getTerms_content());
    		mv.addObject("content_2", list.get(2).getTerms_content());
    		mv.addObject("content_3", list.get(3).getTerms_content());
    		
    		//TermsLogVO select
    		TermsLogVO termsLogVO = new TermsLogVO();
    		termsLogVO.setTlog_userid((String)session.getAttribute("userid"));
    		termsLogVO = memberService.selectTerm(termsLogVO);
    		System.out.println(termsLogVO);
    		mv.addObject("term", termsLogVO);
    		mv.setViewName("member/terms"); 		
    	}else {
    		logger.info("세션 id : "+null);
    		logger.info("삭제실패: 세션정보 없음");
    		mv.setViewName("redirect:../"); 
    	}
    	return mv;	
    }
    
    //약관동의 수정 완료
    @PostMapping("terms")
    public ModelAndView updateTerms(HttpSession session,TermsLogVO termsLogVO)throws Exception{
    	logger.info("=====약관동의 수정 완료=====");
    	ModelAndView mv = new ModelAndView();
    	//세션 검증
    	if(session.getAttribute("userid")!=null){		
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		
    		//TermsLogVO select
    		termsLogVO.setTlog_userid((String)session.getAttribute("userid"));
    		memberService.updateTerms(termsLogVO);
    	
    		logger.info("수정성공");
    		mv.setViewName("member/mypage"); 		
    	
    	}else {
    		logger.info("세션 id : "+null);
    		logger.info("수정실패: 세션정보 없음");
    		mv.setViewName("redirect:../"); 
    	}
    	return mv;	
    }
    
    
  //회원정보 수정 페이지
    @GetMapping("update")
    public ModelAndView goUpdate(HttpSession session) throws Exception{
    	logger.info("=====회원정보 수정 페이지=====");
    	ModelAndView mv = new ModelAndView();
    	
    	//세션 검증
    	if(session.getAttribute("userid")!=null){		
    		logger.info("세션 id : "+(String)session.getAttribute("userid"));
    		MemberVO memberVO = new MemberVO();
    		memberVO.setMem_userid((String)session.getAttribute("userid"));
    		memberVO=memberService.selectUpdate(memberVO);
    		
    		mv.addObject("vo", memberVO);		
    		mv.setViewName("member/update"); 		
    	}else {
    		logger.info("세션 id : "+null);
    		logger.info("삭제실패: 세션정보 없음");
    		mv.setViewName("redirect:../"); 
    	}
    	return mv;	
    }
    
}