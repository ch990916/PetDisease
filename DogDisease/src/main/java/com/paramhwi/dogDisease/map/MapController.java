package com.paramhwi.dogDisease.map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.member.MemberDAO;

@Controller
public class MapController {
	
	@Autowired
<<<<<<< HEAD
	private MemberDAO mDAO;

=======
	MemberDAO mDAO;
	
>>>>>>> origin/branch_JinMyeong
	@RequestMapping(value="/map.go", method=RequestMethod.GET)
	public String MapGo(HttpServletRequest req) {
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "../map/map.jsp");
		return "main/index";
	}
}
