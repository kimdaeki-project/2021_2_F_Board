package com.kb.a1.util;

import javax.servlet.http.HttpSession;

import org.apache.catalina.connector.Response;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.kb.a1.member.MemberController;

@Component
public class SessionCheck {
	
	private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(SessionCheck.class);
	
	//세션이 존재하면 로그아웃 처리하는 메서드
	public int sessionCheck(HttpSession session) throws Exception{
		Response response = new Response();
		//세션 있음 1
    	if(session.getAttribute("member")!=null){		
    		logger.info("세션 id : "+session.getAttribute("member"));
    		logger.info("세션에 값이 발견되어 로그아웃 처리합니다.");
    		session.invalidate();
    		response.sendRedirect("../");
    		return 1; 		
    	}
    		//세션 없음 0
    		logger.info("세션 id : "+session.getAttribute("member"));
    		return 0;
	}
}
