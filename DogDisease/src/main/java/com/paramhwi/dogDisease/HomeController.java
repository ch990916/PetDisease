package com.paramhwi.dogDisease;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.board.PostDAO;
import com.paramhwi.dogDisease.member.Member;
import com.paramhwi.dogDisease.member.MemberDAO;
import com.paramhwi.dogDisease.notice.NoticeDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private boolean firstReq;
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private NoticeDAO nDAO;
	
	public HomeController() {
		firstReq = true;
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req) {
		if(firstReq) {
			nDAO.getAllNoticeCount("");
			firstReq = false;
		}
		nDAO.searchSessionReset(req);
		mDAO.checkLogin(req);
		req.setAttribute("contentPage", "home.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index(HttpServletRequest req) {	
		return home(req);
	}
	
}
