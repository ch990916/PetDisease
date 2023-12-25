package com.paramhwi.dogDisease.member;

import java.io.File;
import java.math.BigDecimal;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Service
public class MemberDAO {
	
	@Autowired
	SqlSession ss;
	
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
			req.setAttribute("state", "사진 오류");
			System.out.println("사진 오류");
			return;
		}
		
		try {			
			String nickname = mr.getParameter("pm_nickname");
			String id = mr.getParameter("pm_id");
			String pw = mr.getParameter("pm_pw");
			
			String jumin1 = mr.getParameter("pm_jumin1");
			String jumin2 = mr.getParameter("pm_jumin2");
			Date birthday;
			
			if(jumin2.equals("1") || jumin2.equals("2")) {
				jumin1 = "19"+jumin1;
			}
			else {
				jumin1 = "20"+jumin1;
			}
			
			birthday = sdf.parse(jumin1);
			String address = mr.getParameter("pm_address1") + "!" + mr.getParameter("pm_address2") + "!" + mr.getParameter("pm_address3");
			String mail = mr.getParameter("pm_mail");
			String file = mr.getFilesystemName("pm_photo");
			file = URLEncoder.encode(file, "utf-8");
			file = file.replace("+", " ");
			
			m.setPm_nickname(nickname);
			m.setPm_birthday(birthday);
			m.setPm_id(id);
			m.setPm_pw(pw);
			m.setPm_address(address);
			m.setPm_photo(file);
			m.setPm_mail(mail);
			
			ss.getMapper(MemberMapper.class).joinMember(m);
			req.setAttribute("state", "회원가입 성공");
			System.out.println("회원가입 성공");
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("state", "오류로 회원가입에 실패하였습니다. 잠시 후 다시 시도해주세요");
			File f = new File(path + "/" + mr.getFilesystemName("pm_photo"));
			f.delete();
		}
	}

	public void login(Member m, HttpServletRequest req) {
		Member user = ss.getMapper(MemberMapper.class).getMemberByID(m);
		if (user != null) {
			if(m.getPm_pw().equals(user.getPm_pw())) {
				if(user.getPm_admin().intValue() < 1) {
					req.setAttribute("state", "로그인 금지. 관리자 문의 요망");
					return;
				}
				req.getSession().setAttribute("user", user);
				return;
			}
			else {
				req.setAttribute("state", "비밀번호 다름");
			}
		}
		else {		
			req.setAttribute("state", "id없음");
		}
		return;
	}

	public boolean checkLogin(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			if(((Member)req.getSession().getAttribute("user")).getPm_admin().intValue() > 3) {
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
	
	public boolean checkAdmin(HttpServletRequest req) {
		if(req.getSession().getAttribute("user") != null) {
			Member user = (Member) req.getSession().getAttribute("user");
			if( user.getPm_admin().intValue() == 4) {
				return true;
			}
			else {
				req.setAttribute("state", "권한이 없습니다.");
				return false;
			}
		}
		else {
			req.setAttribute("state", "권한이 없습니다.");
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
				req.setAttribute("state", "탈퇴 성공");
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
					500*1024*1024, 
					"utf-8", 
					new DefaultFileRenamePolicy());
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("state", "사진 오류");
			return;
		}
		
		try {	
			String nickname = mr.getParameter("pm_nickname");
			String id = ((Member)req.getSession().getAttribute("user")).getPm_id();
			String pw = mr.getParameter("pm_pw");
			String address = mr.getParameter("pm_address1") + "!" + mr.getParameter("pm_address2") + "!" + mr.getParameter("pm_address3");
			String mail = mr.getParameter("pm_mail");
			String file = mr.getFilesystemName("pm_photo");
			String beforeFile = ((Member)req.getSession().getAttribute("user")).getPm_photo();
			if(file != null) {
				file = URLEncoder.encode(file, "utf-8");
				file = file.replace("+", " ");			
			}else {
				file = ((Member)req.getSession().getAttribute("user")).getPm_photo();
			}
			m.setPm_id(id);
			m.setPm_nickname(nickname);
			m.setPm_pw(pw);
			m.setPm_address(address);
			m.setPm_photo(file);
			m.setPm_mail(mail);
			
			if(ss.getMapper(MemberMapper.class).updateMember(m) == 1) {
				System.out.println("수정 성공");
				req.setAttribute("state", "수정 성공");
				if(!file.equals(beforeFile)) {
					beforeFile = URLDecoder.decode(beforeFile,"utf-8");
					new File(path+"/"+beforeFile).delete();
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			req.setAttribute("state", "DB오류");
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
		BigDecimal pm_admin=new BigDecimal(req.getParameter("pm_admin"));
		
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
