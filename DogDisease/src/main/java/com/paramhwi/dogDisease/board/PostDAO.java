package com.paramhwi.dogDisease.board;

import java.io.File;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.paramhwi.dogDisease.IntegratedAttribute;
import com.paramhwi.dogDisease.member.Member;

@Service
public class PostDAO {
	
	@Autowired
	private IntegratedAttribute ia;
	
	@Autowired
	private SqlSession ss;
	
	private int postNumInPage;
	
	
	public void writePost(Post p, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/post");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req, path,500*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			return;
		}
<<<<<<< HEAD
		Member user = (Member) req.getSession().getAttribute("user");
		p.setHp_writer(user.getPm_id());
		if(ss.getMapper(PostMapper.class).writePost(p) == 1) {
			req.setAttribute("result", "글쓰기 성공");
			allPostCount++;
			req.getSession().setAttribute("lastToken", token);
=======
		
		try {
			String token = req.getParameter("token");
			String lastToken = (String) req.getSession().getAttribute("lastToken");	
			if(lastToken != null && lastToken.equals("token")) {
				return;
			}
			
			Member user = (Member) req.getSession().getAttribute("user");
			p.setPp_writer(user.getPm_id());
			p.setPp_picture(mr.getFilesystemName("pp_picture"));
			p.setPp_content(mr.getParameter("pp_content"));
			if(ss.getMapper(PostMapper.class).writePost(p) == 1) { 
				req.setAttribute("result", "글쓰기 성공");
				req.getSession().setAttribute("lastToken", token);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			return;
>>>>>>> origin/branch_JinMyeong
		}
	}

	public void searchPage(HttpServletRequest req) {
		postNumInPage = ia.getPostNumInPage();
		SearchInfo si = new SearchInfo(1, 1+postNumInPage, "");
		List<Post> posts = ss.getMapper(PostMapper.class).searchPage(si);
		for (Post p : posts) {
			List<PostReply> reply = ss.getMapper(PostMapper.class).getReply(p);
			p.setPp_replys(reply);
		}
		req.setAttribute("posts", posts);
	}
	
	public List<Post> loadPost(HttpServletRequest req){
		int page = Integer.parseInt(req.getParameter("page"));
		SearchInfo si = new SearchInfo(page,page+postNumInPage,"");
		List<Post> posts = ss.getMapper(PostMapper.class).searchPage(si);
		for (Post p: posts) {
			List<PostReply> reply = ss.getMapper(PostMapper.class).getReply(p);
			p.setPp_replys(reply);
		}
		return posts;
	}
	
	
	public void getReply(HttpServletRequest req) {
		Post p = new Post();
		p.setPp_no(Integer.parseInt(req.getParameter("pp_no")));
		List<PostReply> reply = ss.getMapper(PostMapper.class).getReply(p);
		req.setAttribute("replys", reply );
	}
	
	public void writeReply(PostReply pr, HttpServletRequest req) {
		Member user = (Member) req.getSession().getAttribute("user");
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("lastToken");
		if(lastToken != null && lastToken.equals(token)) {
			System.out.println("댓글쓰기 실패");
			return;
		}
		
		pr.setPr_pp_no(Integer.parseInt(req.getParameter("pr_pp_no")));
		pr.setPr_writer(user.getPm_id());
		pr.setPr_content(req.getParameter("pr_content"));
		if(ss.getMapper(PostMapper.class).writeReply(pr) == 1) {
			req.setAttribute("result", "댓글쓰기 성공");
			req.getSession().setAttribute("lastToken", token);
		}
	}
	
	public void deletePost(Post p, HttpServletRequest req) {
		try {
			p.setPp_no(Integer.parseInt(req.getParameter("pp_no"))); 
			if(ss.getMapper(PostMapper.class).deletePost(p)==1) {
				String path = req.getSession().getServletContext().getRealPath("resources/post");
				String file = URLDecoder.decode(req.getParameter("pp_picture"),"utf-8");
				new File(path + "/" + file).delete();

			}			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Post Delete Failed");
		}
	}
	
	public void deleteReply(PostReply pr, HttpServletRequest req) {
		pr.setPr_no(Integer.parseInt(req.getParameter("pr_no")));
		ss.getMapper(PostMapper.class).deleteReply(pr);

	}
	
	public void updatePost(Post p, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/post");
		MultipartRequest mr = null;
		try {
			mr = new MultipartRequest(req,path,500*1024*1024,"utf-8",new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Post Update Failed");
			return;
		}
		
		try {
			String pastpicture = req.getParameter("pp_pastpicture");
			p.setPp_no(Integer.parseInt(mr.getParameter("pp_no")));
			p.setPp_picture(mr.getFilesystemName("pp_picture"));
			p.setPp_content(mr.getParameter("pp_content"));
			
			if(ss.getMapper(PostMapper.class).updatePost(p)==1) {
				System.out.println("Post Updated");
				if(pastpicture.equals(mr.getFilesystemName("pp_picture"))){
					pastpicture=URLDecoder.decode(pastpicture,"utf-8");
					new File(path+"/"+pastpicture).delete();
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			File f = new File(path+"/"+ mr.getFilesystemName("pp_picutre"));
			f.delete();
		}
	}
	
}
