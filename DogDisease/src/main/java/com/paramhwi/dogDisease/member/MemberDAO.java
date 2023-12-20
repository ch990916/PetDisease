package com.paramhwi.dogDisease.member;

import java.io.File;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
		MultipartRequest mr = null;
		try {
			 mr = new MultipartRequest(
					req, 
					path, 
					500*1024*1024, 
					"utf-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "사진 등록 오류");
			return;
		}
		
		try {			
			//데이터베이스에 회원 정보 등록
			String pm_id=mr.getParameter("pm_id");
			String pm_pw=mr.getParameter("pm_pw");
			String pm_nickname=mr.getParameter("pm_nickname");
			String pm_address=mr.getParameter("pm_address1") + "!" + mr.getParameter("pm_address2") + "!" + mr.getParameter("pm_address3");
			Date pm_birthday=sdf.parse(mr.getParameter("pm_birthday"));
			String pm_photo=mr.getFilesystemName("pm_photo");
			String pm_mail=mr.getParameter("pm_mail");
			
			m.setPm_id(pm_id);
			m.setPm_pw(pm_pw);
			m.setPm_nickname(pm_nickname);
			m.setPm_address(pm_address);
			m.setPm_birthday(pm_birthday);
			m.setPm_photo(pm_photo);
			m.setPm_mail(pm_mail);
			m.setPm_admin(3);
			
			ss.getMapper(MemberMapper.class).joinMember(m);
			req.setAttribute("result", "회원 가입 완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("???");
			File f = new File(path + "/" + mr.getFilesystemName("pm_photo"));
			f.delete();
		}
	}

	public void login(Member m, HttpServletRequest req) {
		Member user = ss.getMapper(MemberMapper.class).getMemberByID(m);
		if (user != null) {
			if(m.getPm_pw().equals(user.getPm_pw())) {
				if(user.getPm_admin()<1) {
					req.setAttribute("result", "로그인 금지. 관리자 문의 요망");
					return;
				}
				req.getSession().setAttribute("user", user);
				return;
			}
			else {
				req.setAttribute("result", "id 혹은 비밀번호가 일치하지 않습니다.");
			}
		}
		else {		
			req.setAttribute("result", "id 혹은 비밀번호가 일치하지 않습니다.");
		}
		return;
	}

	public boolean checkLogin(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			Member user = (Member) req.getSession().getAttribute("user");
			Integer admin = user.getPm_admin();
			if (admin>3) {
				req.setAttribute("loginPage", "../member/loginComplete_admin.jsp");
				return true;
			}
			else {
			req.setAttribute("loginPage", "../member/loginComplete.jsp");
			return true;
			}
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
		String address = user.getPm_address();
		String[] addresses = address.split("!");
		req.setAttribute("address1", addresses[0]);
		req.setAttribute("address2", addresses[1]);
		req.setAttribute("address3", addresses[2]);
	}
	
	public void deleteMember(HttpServletRequest req) {
		try {
			Member user = (Member)req.getSession().getAttribute("user");
			if(ss.getMapper(MemberMapper.class).deleteMember(user) == 1) {		
				req.setAttribute("result", "탈퇴 성공");
				String path = req.getSession().getServletContext().getRealPath("resources/userfiles");
				String file = URLDecoder.decode(user.getPm_photo(),"utf-8");
				new File(path + "/" + file).delete();
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
					100*1024*1024, 
					"utf-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("result", "사진 등록 오류");
			return;
		}
		
		try {	
			String pm_id = ((Member)req.getSession().getAttribute("user")).getPm_id();
			String pm_nickname = mr.getParameter("pm_nickname");
			String pm_pw = mr.getParameter("pm_pw");
			String pm_address = mr.getParameter("pm_address1") + "!" + mr.getParameter("pm_address2") + "!" + mr.getParameter("pm_address3");
			String file = mr.getFilesystemName("pm_photo");
			String beforeFile = ((Member)req.getSession().getAttribute("user")).getPm_photo();
			String pm_mail = mr.getParameter("pm_mail");
			
			if(file != null) {
				file = URLEncoder.encode(file, "utf-8");
				file = file.replace("+", " ");			
			}else {
				file = ((Member)req.getSession().getAttribute("user")).getPm_photo();
			}
			m.setPm_id(pm_id);
			m.setPm_pw(pm_pw);
			m.setPm_nickname(pm_nickname);
			m.setPm_address(pm_address);
			m.setPm_photo(file);
			m.setPm_mail(pm_mail);
			
			if(ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				req.setAttribute("result", "정보 수정 성공");
				if(!file.equals(beforeFile)) {
					beforeFile = URLDecoder.decode(beforeFile,"utf-8");
					new File(path+"/"+beforeFile).delete();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			File f = new File(path + "/" + mr.getFilesystemName("pm_photo"));
			f.delete();
		}
	}


	public Members MemberGet(HttpServletRequest req) {
		Member m = new Member();
		m.setPm_id(req.getParameter("pm_id"));
		List<Member> members = ss.getMapper(MemberMapper.class).getMemberByID2(m);
		return new Members(members);
	}
	
	public void adminMemberGet(HttpServletRequest req) {
		List<Member> members = ss.getMapper(MemberMapper.class).adminMemberGet();
		req.setAttribute("members", members);
	}
	
	public void adminMemberInfo(HttpServletRequest req) {
		Member m = new Member();
		m.setPm_id(req.getParameter("id"));
		Member member = ss.getMapper(MemberMapper.class).getMemberByID(m);
		req.setAttribute("member", member);
	}
	
	public void adminMemberDelete(Member m,HttpServletRequest req) {
		m.setPm_id(req.getParameter("pm_id"));
		if(ss.getMapper(MemberMapper.class).deleteMember(m)==1){
			req.setAttribute("result", "Memeber Deleted");
		}else {
			req.setAttribute("result", "Member Delete Failed");
		}
	}
	
	public void changeAdmin(HttpServletRequest req) {
		String pm_id=req.getParameter("pm_id");
		Integer pm_admin=Integer.parseInt(req.getParameter("pm_admin"));
		
		Member m = new Member();
		m.setPm_id(pm_id);
		m.setPm_admin(pm_admin);
				
		if(ss.getMapper(MemberMapper.class).updateAdmin(m)==1) {
			req.setAttribute("result", "Admin Updated");
		}else {
			req.setAttribute("result", "Admin Update Failed");
		}
	}
	
}
