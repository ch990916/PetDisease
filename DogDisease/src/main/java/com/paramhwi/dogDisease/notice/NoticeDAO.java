package com.paramhwi.dogDisease.notice;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paramhwi.dogDisease.IntegratedAttribute;
import com.paramhwi.dogDisease.board.Post;
import com.paramhwi.dogDisease.board.PostMapper;
import com.paramhwi.dogDisease.board.SearchInfo;
import com.paramhwi.dogDisease.member.Member;

@Service
public class NoticeDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private IntegratedAttribute ia;
	
	private int allNoticeCount;
	private int noticeNumInPage;
	
	public int getAllNoticeCount(String searchWord) {
		SearchInfo si = new SearchInfo(0, 0, searchWord);
		int noticeCount = ss.getMapper(NoticeMapper.class).getAllNoticeCount(si);
		allNoticeCount = (noticeCount > allNoticeCount) ? noticeCount : allNoticeCount;
		return noticeCount;
	}
	
	public void searchSessionReset(HttpServletRequest req) {
		req.getSession().setAttribute("searchWord", null);
	}
	
	public void searchPage(int page, HttpServletRequest req) {
		String searchWord = (String) req.getSession().getAttribute("searchWord");
		int noticeCount = allNoticeCount;
		if(searchWord != null) {
			noticeCount = getAllNoticeCount(searchWord);
		}
		else {
			searchWord="";
		}
		noticeNumInPage = ia.getNoticeNumInPage();
		int pageNum = noticeCount % noticeNumInPage == 0 ?  noticeCount / noticeNumInPage : noticeCount / noticeNumInPage + 1;
		int startNum = (page - 1) * noticeNumInPage + 1;
		int endNum = startNum + noticeNumInPage - 1;
		SearchInfo si = new SearchInfo(startNum, endNum, searchWord);
		List<Notice> notices = ss.getMapper(NoticeMapper.class).searchNoticePage(si);
		req.setAttribute("notices", notices);
		req.setAttribute("pageCount", pageNum);
	}
	
	public void writeNotice(Notice n, HttpServletRequest req) {
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("lastToken");
		if(lastToken != null && lastToken.equals(token)) {
			req.setAttribute("state", "글쓰기 실패");
			System.out.println("글쓰기 실패");
			return;
		}
		Member user = (Member) req.getSession().getAttribute("user");
		n.setPn_writer(user.getPm_id());
		if(ss.getMapper(NoticeMapper.class).writeNotice(n) == 1) {
			req.setAttribute("state", "글쓰기 성공");
			allNoticeCount++;
			req.getSession().setAttribute("lastToken", token);
		}
	}
	
	public void getNoticeContent(HttpServletRequest req) {
		BigDecimal no = new BigDecimal(req.getParameter("no"));
		Notice tmp = new Notice();
		tmp.setPn_no(no);
		Notice n = ss.getMapper(NoticeMapper.class).searchNoticeContent(tmp);
		req.setAttribute("notice", n);
		
	}
	
	public void searchWord(HttpServletRequest req) {
		if(req.getParameter("searchWord") == null) {
			req.getSession().setAttribute("searchWord", null);
		}
		else {
			req.getSession().setAttribute("searchWord", req.getParameter("searchWord"));
		}
	}

}
