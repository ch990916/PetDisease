package com.paramhwi.dogDisease.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.paramhwi.dogDisease.board.PostDAO;

@Service
public class MemberDAO {
	
	@Autowired
	SqlSession ss;
	
	@Autowired
	PostDAO pDAO;
	
	private SimpleDateFormat sdf;
	
	public MemberDAO() {
		sdf = new SimpleDateFormat("yyyyMMdd");
	}
	public void join(Member m, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/userfiles");
		System.out.println(path);
		MultipartRequest mr = null;
		try {
			 mr = new MultipartRequest(
					req, 
					path, 
					10*1024*1024, 
					"utf-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("joinResult", "사진 오류");
			System.out.println("사진 오류");
			return;
		}
		
		try {			
			String name = mr.getParameter("hm_name");
			String id = mr.getParameter("hm_id");
			String pw = mr.getParameter("hm_pw");
			
			String jumin1 = mr.getParameter("hm_jumin1");
			String jumin2 = mr.getParameter("hm_jumin2");
			Date birthday;
			
			if(jumin2.equals("1") || jumin2.equals("2")) {
				jumin1 = "19"+jumin1;
			}
			else {
				jumin1 = "20"+jumin1;
			}
			
			birthday = sdf.parse(jumin1);
			String address = mr.getParameter("hm_address1") + "!" + mr.getParameter("hm_address2") + "!" + mr.getParameter("hm_address3");
			String file = mr.getFilesystemName("hm_photo");
			file = URLEncoder.encode(file, "utf-8");
			file = file.replace("+", " ");
			
			m.setHm_name(name);
			m.setHm_birthday(birthday);
			m.setHm_id(id);
			m.setHm_pw(pw);
			m.setHm_address(address);
			m.setHm_photo(file);
			
			ss.getMapper(MemberMapper.class).joinMember(m);
			req.setAttribute("joinResult", "성공");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("뭔가 오류");
			File f = new File(path + "/" + mr.getFilesystemName("hm_photo"));
			f.delete();
		}
	}

	public void login(Member m, HttpServletRequest req) {
		Member user = ss.getMapper(MemberMapper.class).getMemberByID(m);
		
		if (user != null) {
			if(m.getHm_pw().equals(user.getHm_pw())) {
				req.getSession().setAttribute("user", user);
				return;
			}
			else {
				req.setAttribute("loginResult", "비밀번호 다름");
			}
		}
		else {		
			req.setAttribute("loginResult", "id없음");
		}
		return;
	}

	public boolean checkLogin(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			req.setAttribute("loginPage", "../member/loginComplete.jsp");
			return true;
		}
		else {	
			req.setAttribute("loginPage", "../member/loginForm.jsp");
			return false;
		}
	}
	
	public void logout(HttpServletRequest req) {
		req.getSession().setAttribute("user", null);
	}
	
	public void splitAddress(HttpServletRequest req) {
		Member user = (Member) req.getSession().getAttribute("user");
		String address = user.getHm_address();
		String[] addresses = address.split("!");
		req.setAttribute("address1", addresses[0]);
		req.setAttribute("address2", addresses[1]);
		req.setAttribute("address3", addresses[2]);
	}
	
	public void deleteMember(HttpServletRequest req) {
		try {
			Member user = (Member)req.getSession().getAttribute("user");
			int userPost = ss.getMapper(MemberMapper.class).getPostCount(user);
			if(ss.getMapper(MemberMapper.class).deleteMember(user) == 1) {		
				req.setAttribute("result", "탈퇴 성공");
				String path = req.getSession().getServletContext().getRealPath("resources/userfiles");
				String file = URLDecoder.decode(user.getHm_photo(),"utf-8");
				new File(path + "/" + file).delete();
				pDAO.decreasePostCount(userPost);
			}		
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "탈퇴 실패");
		}
	}

	public void memberUpdate(Member m, HttpServletRequest req) {
		String path = req.getSession().getServletContext().getRealPath("resources/userfiles");
		MultipartRequest mr = null;
		try {
			 mr = new MultipartRequest(
					req, 
					path, 
					10*1024*1024, 
					"utf-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("joinResult", "사진 오류");
			System.out.println("사진 오류");
			return;
		}
		
		try {	
			String name = mr.getParameter("hm_name");
			String id = ((Member)req.getSession().getAttribute("user")).getHm_id();
			String pw = mr.getParameter("hm_pw");
			String address = mr.getParameter("hm_address1") + "!" + mr.getParameter("hm_address2") + "!" + mr.getParameter("hm_address3");
			String file = mr.getFilesystemName("hm_photo");
			String beforeFile = ((Member)req.getSession().getAttribute("user")).getHm_photo();
			if(file != null) {
				file = URLEncoder.encode(file, "utf-8");
				file = file.replace("+", " ");			
			}else {
				file = ((Member)req.getSession().getAttribute("user")).getHm_photo();
			}
			m.setHm_id(id);
			m.setHm_name(name);
			m.setHm_pw(pw);
			m.setHm_address(address);
			m.setHm_photo(file);
			
			if(ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				System.out.println("수정 성공");
				req.setAttribute("result", "수정 성공");
				if(!file.equals(beforeFile)) {
					beforeFile = URLDecoder.decode(beforeFile,"utf-8");
					new File(path+"/"+beforeFile).delete();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("뭔가 오류");
			File f = new File(path + "/" + mr.getFilesystemName("hm_photo"));
			f.delete();
		}
	}


	public Members MemberGet(HttpServletRequest req) {
		Member m = new Member();
		m.setHm_id(req.getParameter("hm_id"));
		List<Member> members = ss.getMapper(MemberMapper.class).getMemberByID2(m);
		return new Members(members);
	}
	
}
