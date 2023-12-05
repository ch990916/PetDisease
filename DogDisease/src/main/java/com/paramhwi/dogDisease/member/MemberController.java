package com.paramhwi.dogDisease.member;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO mDAO;
	
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../member/joinForm.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/join.member", method = RequestMethod.POST)
	public String joinMember(Member m, HttpServletRequest req) {	
		mDAO.join(m, req);
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../main/home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Member m, HttpServletRequest req) {	
		mDAO.login(m, req);
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../main/home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpServletRequest req) {	
		mDAO.logout(req);
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../main/home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/memberInfo", method = RequestMethod.GET)
	public String memberInfo(HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			mDAO.splitAddress(req);
			req.setAttribute("contentPage", "../member/memberInfo.jsp");		
		}
		else {
			req.setAttribute("contentPage", "../main/home.jsp");					
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/deleteMember", method = RequestMethod.GET)
	public String deleteMember(HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			mDAO.deleteMember(req);
			logout(req);
		}
		req.setAttribute("contentPage", "../main/home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/member.update", method = RequestMethod.POST)
	public String memberUpdate(Member m, HttpServletRequest req) {	
		mDAO.memberUpdate(m, req);
		mDAO.login(m, req);
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../main/home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/member.get", method = RequestMethod.GET, produces="application/json; charset=utf-8")
	public @ResponseBody Members memberGet(Member m, HttpServletRequest req) {	
		return mDAO.MemberGet(req);
	}
}
