package com.paramhwi.dogDisease.board;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.paramhwi.dogDisease.IntegratedAttribute;
import com.paramhwi.dogDisease.member.Member;

@Service
public class PostDAO {
	
	@Autowired
	private IntegratedAttribute ia;
	
	@Autowired
	private SqlSession ss;
	
	private int allPostCount;
	private int postNumInPage;
	
	
	public int getAllPostCount(String searchWord) {
		SearchInfo si = new SearchInfo(0, 0, searchWord);
		int postCount = ss.getMapper(PostMapper.class).getAllPostCount(si);
		allPostCount = (postCount > allPostCount) ? postCount : allPostCount;
		return postCount;
	}
	
	public void writePost(Post p, HttpServletRequest req) {
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("lastToken");
		if(lastToken != null && lastToken.equals(token)) {
			req.setAttribute("result", "글쓰기 실패");
			System.out.println("글쓰기 실패");
			return;
		}
		Member user = (Member) req.getSession().getAttribute("user");
		p.setHp_writer(user.getHm_id());
		if(ss.getMapper(PostMapper.class).writePost(p) == 1) {
			req.setAttribute("result", "글쓰기 성공");
			allPostCount++;
			req.getSession().setAttribute("lastToken", token);
		}
	}

	public void searchPage(int page, HttpServletRequest req) {
		String searchWord = (String) req.getSession().getAttribute("searchWord");
		int postCount = allPostCount;
		if(searchWord != null) {
			postCount = getAllPostCount(searchWord);
		}
		else {
			searchWord="";
		}
		postNumInPage = ia.getPostNumInPage();
		int pageNum = postCount % postNumInPage == 0 ?  postCount / postNumInPage : postCount / postNumInPage + 1;
		int startNum = (page - 1) * postNumInPage + 1;
		int endNum = startNum + postNumInPage - 1;
		SearchInfo si = new SearchInfo(startNum, endNum, searchWord);
		List<Post> posts = ss.getMapper(PostMapper.class).searchPage(si);
		req.setAttribute("posts", posts);
		req.setAttribute("pageCount", pageNum);
	}
	
	public void getPostContent(HttpServletRequest req) {
		BigDecimal no = new BigDecimal(req.getParameter("no"));
		Post tmp = new Post();
		tmp.setHp_no(no);
		Post p = ss.getMapper(PostMapper.class).searchContent(tmp);
		p.setHp_replys(ss.getMapper(PostMapper.class).getReply(tmp));
		req.setAttribute("post", p);
		
	}
	
	public void searchWord(HttpServletRequest req) {
		if(req.getParameter("searchWord") == null) {
			req.getSession().setAttribute("searchWord", null);
		}
		else {
			req.getSession().setAttribute("searchWord", req.getParameter("searchWord"));
		}
	}
	
	public void searchSessionReset(HttpServletRequest req) {
		req.getSession().setAttribute("searchWord", null);
	}
	
	public void decreasePostCount(int postCount) {
		allPostCount = allPostCount - postCount;
	}
	
	public void writeReply(PostReply pr, HttpServletRequest req) {
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("lastToken");
		if(lastToken != null && lastToken.equals(token)) {
			System.out.println("댓글쓰기 실패");
			return;
		}
		if(ss.getMapper(PostMapper.class).writeReply(pr) == 1) {
			req.setAttribute("result", "댓글쓰기 성공");
			req.getSession().setAttribute("lastToken", token);
		}
	}
	
}
