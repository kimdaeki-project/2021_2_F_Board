package com.kb.a1.member;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/member/**")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	
	
	@GetMapping("login")
	public void login()throws Exception{
		System.out.println("=====로그인=====");
	}
	
	@GetMapping("join")
	public ModelAndView join()throws Exception{
		System.out.println("=====회원가입=====");
		ModelAndView mv = new ModelAndView();
		
		List<TermsVO> list = memberService.selectTermsList();
		mv.setViewName("member/join");
		mv.addObject("content_0", list.get(0).getTerms_content());
		mv.addObject("content_1", list.get(1).getTerms_content());
		mv.addObject("content_2", list.get(2).getTerms_content());
		mv.addObject("content_3", list.get(3).getTerms_content());
		
		return mv;
	}
	

	
	
	
	
}
