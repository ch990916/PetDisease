package com.paramhwi.dogDisease.board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
		tg.generate(req);
		pDAO.searchPage(req);
		req.setAttribute("contentPage", "../board/boardIndex.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/post.load", method = RequestMethod.GET)
	@ResponseBody
	public List<Post> boardChange(HttpServletRequest req) {
		return pDAO.loadPost(req);
	}
	
	@RequestMapping(value = "/board.write", method = RequestMethod.GET)
	public String writeGo(HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			tg.generate(req);
			req.setAttribute("contentPage", "../board/postWrite.jsp");			
		}
		else {
			System.out.println("login Check failed");
			req.setAttribute("contentPage", "../board/boardIndex.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/write.post", method = RequestMethod.POST)
	public String writePost(Post p, HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			pDAO.writePost(p, req);
			pDAO.searchPage(req);
			req.setAttribute("contentPage", "../board/boardIndex.jsp");		
		}
		else {			
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
	}
	
	@RequestMapping(value = "/reply.write", method = RequestMethod.POST)
	public String replyWrite(Member m,PostReply pr ,HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			pDAO.writeReply(pr, req);
		}
		return boardGo(req);
	}
	
	@RequestMapping(value="/reply.delete", method=RequestMethod.POST)
	public String replyDelete(PostReply pr,HttpServletRequest req) {
		mDAO.checkLogin(req);
		pDAO.deleteReply(pr, req);
		return boardGo(req);
	}
	
	@RequestMapping(value="/post.delete", method=RequestMethod.POST)
	public String deletePost(Member m,Post p,HttpServletRequest req) {
		mDAO.checkLogin(req);
		pDAO.deletePost(p, req);
		return boardGo(req);
	}
}
