package com.paramhwi.dogDisease.dataroom;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.TokenGenerator;
import com.paramhwi.dogDisease.member.MemberDAO;

@Controller
public class DataroomController {
	
	@Autowired
	MemberDAO mDAO;
	
	@Autowired
	TokenGenerator tg;
	
	@Autowired
	DataDAO dDAO;
	
	@RequestMapping(value = "/dataroom.go", method = RequestMethod.GET)
	public String dataroomGo(HttpServletRequest req) {
		if(mDAO.checkLogin(req)) {
			dDAO.getFile(1,req);
			req.setAttribute("contentPage", "../dataroom/dataroomMain.jsp");
		}
		else {
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/upload.go", method = RequestMethod.GET)
	public String uploadGo(HttpServletRequest req) {
		if(mDAO.checkLogin(req)) {
			tg.generate(req);
			req.setAttribute("contentPage", "../dataroom/dataUpload.jsp");
		}
		else {
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/upload.exec", method = RequestMethod.POST)
	public String uploadExecute(HttpServletRequest req) {
		if(mDAO.checkLogin(req)) {
			dDAO.upload(req);
			dDAO.getFile(1, req);
			req.setAttribute("contentPage", "../dataroom/dataroomMain.jsp");
		}
		else {
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/dataroom.download", method = RequestMethod.GET)
	public String dataroomDownload(FileData fd,HttpServletRequest req, HttpServletResponse res) {
		if(mDAO.checkLogin(req)) {
			dDAO.download(fd, req, res);
		}
		tg.generate(req);
		dDAO.getFile(1, req);
		req.setAttribute("contentPage", "../dataroom/dataroomMain.jsp");
		
		return "main/index";
	}

}
