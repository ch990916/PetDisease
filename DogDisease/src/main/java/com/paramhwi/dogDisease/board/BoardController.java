package com.paramhwi.dogDisease.board;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.TokenGenerator;
import com.paramhwi.dogDisease.member.Member;
import com.paramhwi.dogDisease.member.MemberDAO;

@Controller
public class BoardController {
	@Autowired
	MemberDAO mDAO;
	
	@Autowired
	PostDAO pDAO;
	
	@Autowired
	TokenGenerator tg;
	
	@RequestMapping(value = "/board.go", method = RequestMethod.GET)
	public String boardGo(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		pDAO.searchSessionReset(req);
		pDAO.searchPage(1, req);
		req.setAttribute("contentPage", "../board/boardIndex.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/board.change", method = RequestMethod.GET)
	public String boardChange(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		pDAO.searchPage(Integer.parseInt(req.getParameter("page")), req);
		req.setAttribute("contentPage", "../board/boardIndex.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/write.go", method = RequestMethod.GET)
	public String writeGo(HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			tg.generate(req);
			req.setAttribute("contentPage", "../board/postWrite.jsp");			
		}
		else {			
			req.setAttribute("contentPage", "../board/boardIndex.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePost(Post p, HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			pDAO.writePost(p, req);
			pDAO.searchPage(1, req);
			req.setAttribute("contentPage", "../board/boardIndex.jsp");		
		}
		else {			
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/post.content.go", method = RequestMethod.GET)
	public String postContentGo(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		pDAO.getPostContent(req);
		tg.generate(req);
		req.setAttribute("contentPage", "../board/postContent.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/board.search", method = RequestMethod.GET)
	public String boardSearch(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		pDAO.searchWord(req);
		pDAO.searchPage(1, req);
		req.setAttribute("contentPage", "../board/boardIndex.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/reply.write", method = RequestMethod.GET)
	public String replyWrite(Member m,PostReply pr ,HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			pDAO.writeReply(pr, req);
		}
		pDAO.getPostContent(req);
		req.setAttribute("contentPage", "../board/postContent.jsp");
		return "main/index";
	}
}
