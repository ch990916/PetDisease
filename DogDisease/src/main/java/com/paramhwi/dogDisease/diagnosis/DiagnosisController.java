package com.paramhwi.dogDisease.diagnosis;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.member.MemberDAO;

@Controller
public class DiagnosisController {
<<<<<<< HEAD
	
	@Autowired
	private MemberDAO mDAO;
	
	@RequestMapping(value="/diagnosis.go", method=RequestMethod.GET)
	public String MapGo(HttpServletRequest req) {
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../diagnosis/sendPhoto.jsp");
=======

	@Autowired
	MemberDAO mDAO;
	
	@RequestMapping(value="/diagnosis.go", method=RequestMethod.GET)
	public String diagnosisGo(HttpServletRequest req) {
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../diagnosis/diagnosis.jsp");
>>>>>>> origin/branch_JinMyeong
		return "main/index";
	}
}
