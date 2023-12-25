package com.paramhwi.dogDisease.notice;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.paramhwi.dogDisease.TokenGenerator;
import com.paramhwi.dogDisease.member.MemberDAO;

@Controller
public class NoticeController {
	
	@Autowired
	private MemberDAO mDAO;
	
	@Autowired
	private NoticeDAO nDAO;
	
	@Autowired
	private TokenGenerator tg;
	
<<<<<<< HEAD
	@RequestMapping(value = "/notice.board.go", method = RequestMethod.GET)
=======
	@RequestMapping(value = "/notice.go", method = RequestMethod.GET)
>>>>>>> origin/branch_JinMyeong
	public String noticeBoardGo(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		nDAO.searchSessionReset(req);
		nDAO.searchPage(1, req);
		req.setAttribute("contentPage", "../notice/noticeIndex.jsp");
		return "main/index";
	}
	
<<<<<<< HEAD
	@RequestMapping(value = "/notice.write.go", method = RequestMethod.GET)
	public String noticeWriteGo(HttpServletRequest req) {	
		if(mDAO.checkLogin(req)) {
			if(mDAO.checkAdmin(req)) {
				tg.generate(req);
				req.setAttribute("contentPage", "../notice/noticeWrite.jsp");						
			}
			else {
				nDAO.searchSessionReset(req);
				nDAO.searchPage(1, req);
				req.setAttribute("contentPage", "../notice/noticeIndex.jsp");
			}
		}
		else {	
			nDAO.searchSessionReset(req);
			nDAO.searchPage(1, req);
			req.setAttribute("contentPage", "../notice/noticeIndex.jsp");
		}
=======
	@RequestMapping(value = "/notice.write", method = RequestMethod.GET)
	public String noticeWriteGo(HttpServletRequest req) { 	
		mDAO.checkLogin(req);
		tg.generate(req);
		req.setAttribute("contentPage", "../notice/noticeWrite.jsp");
>>>>>>> origin/branch_JinMyeong
		return "main/index";
	}
	
	@RequestMapping(value = "/notice.write.reg", method = RequestMethod.POST)
	public String noticeWriteReg(Notice n, HttpServletRequest req) {	
<<<<<<< HEAD
		if(mDAO.checkLogin(req) && mDAO.checkAdmin(req)) {
			nDAO.writeNotice(n, req);
			nDAO.searchSessionReset(req);
			nDAO.searchPage(1, req);
			req.setAttribute("contentPage", "../notice/noticeIndex.jsp");		
=======
		if(mDAO.checkLogin(req)) {
			nDAO.writeNotice(n, req);
			nDAO.searchPage(1, req);
			return noticeBoardGo(req);		
>>>>>>> origin/branch_JinMyeong
		}
		else {
			req.setAttribute("state", "로그인 후 사용해주세요");
			req.setAttribute("contentPage", "../main/home.jsp");
<<<<<<< HEAD
		}
		return "main/index";
=======
			return "main/index";
		}
>>>>>>> origin/branch_JinMyeong
	}
	
	@RequestMapping(value = "/notice.content.go", method = RequestMethod.GET)
	public String noticeContentGo(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		nDAO.getNoticeContent(req);
		tg.generate(req);
		req.setAttribute("contentPage", "../notice/noticeContent.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/notice.board.search", method = RequestMethod.GET)
	public String boardSearch(HttpServletRequest req) {	
		mDAO.checkLogin(req);
		nDAO.searchWord(req);
		nDAO.searchPage(1, req);
		req.setAttribute("contentPage", "../notice/noticeIndex.jsp");
		return "main/index";
	}
	
<<<<<<< HEAD
	@RequestMapping(value = "/notice.board.del", method=RequestMethod.GET)
	public String noticeBoardDel(HttpServletRequest req) {
		if(mDAO.checkLogin(req) && mDAO.checkAdmin(req)) {
			mDAO.checkLogin(req);
			nDAO.noticeDelete(req);
		}
		nDAO.searchSessionReset(req);
		nDAO.searchPage(1, req);
		req.setAttribute("contentPage", "../notice/noticeIndex.jsp");
		return "main/index";
	}
	
	@RequestMapping(value="/notice.board.modify.go", method=RequestMethod.GET)
	public String noticeBoardModifyGo(Notice n, HttpServletRequest req) {
		mDAO.checkLogin(req);
		tg.generate(req);
		req.setAttribute("notice", n);
		req.setAttribute("contentPage", "../notice/noticeModify.jsp");
		return "main/index";
	}
	
	@RequestMapping(value = "/notice.board.modify", method = RequestMethod.POST)
	public String noticeBoardModify(Notice n, HttpServletRequest req) {	
		if(mDAO.checkLogin(req) && mDAO.checkAdmin(req)) {
			nDAO.modifyNotice(n, req);
			nDAO.searchSessionReset(req);
			nDAO.searchPage(1, req);
			req.setAttribute("contentPage", "../notice/noticeIndex.jsp");		
		}
		else {
			req.setAttribute("state", "로그인 후 사용해주세요");
			req.setAttribute("contentPage", "../main/home.jsp");
		}
		return "main/index";
=======
	@RequestMapping(value="/notice.delete", method=RequestMethod.POST)
	public String deleteNotice(HttpServletRequest req) {
		mDAO.checkLogin(req);
		nDAO.DeleteNotice(req);
		return noticeBoardGo(req);
	}
	
	@RequestMapping(value="/notice.update.go", method=RequestMethod.POST)
	public String goUpdateNotice(HttpServletRequest req) {
		mDAO.checkLogin(req);
		nDAO.getNoticeContent(req);
		req.setAttribute("contentPage", "../notice/noticeUpdate.jsp");
		return "main/index";
	}
	
	@RequestMapping(value="/notice.update", method=RequestMethod.POST)
	public String UpdateNotice(Notice n, HttpServletRequest req) {
		mDAO.checkLogin(req);
		nDAO.UpdateNotice(n, req);
		return noticeBoardGo(req);
>>>>>>> origin/branch_JinMyeong
	}
}
