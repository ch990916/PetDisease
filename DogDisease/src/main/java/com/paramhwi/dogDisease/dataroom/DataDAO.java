package com.paramhwi.dogDisease.dataroom;

import java.io.FileInputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.paramhwi.dogDisease.IntegratedAttribute;
import com.paramhwi.dogDisease.board.PostMapper;
import com.paramhwi.dogDisease.board.SearchInfo;
import com.paramhwi.dogDisease.member.Member;

@Service
public class DataDAO {
	
	@Autowired
	private SqlSession ss;
	
	@Autowired
	private IntegratedAttribute ia;
	
	private int allFileCount;
	private int fileNumInPage;
	
	public DataDAO() {
		// TODO Auto-generated constructor stub
	}
	
	public int getAllFileCount(String searchWord) {
		SearchInfo si = new SearchInfo(0, 0, searchWord);
		int fileCount = ss.getMapper(DataMapper.class).getAllFileCount(si);
		allFileCount = (fileCount > allFileCount) ? fileCount : allFileCount;
		return fileCount;
	}
	
	public void upload(HttpServletRequest req) {
		String token = req.getParameter("token");
		String lastToken = (String) req.getSession().getAttribute("lastToken");
		if(lastToken != null && lastToken.equals(token)) {
			System.out.println("업로드 실패");
			return;
		}
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
			System.out.println("파일 오류");
			return;
		}
		try {
			String title = mr.getParameter("hd_title");
			String file = mr.getFilesystemName("hd_file");
			String uploader = ((Member)req.getSession().getAttribute("user")).getHm_id();
			file = URLEncoder.encode(file, "utf-8");
			file = file.replace("+", " ");
			
			FileData fd = new FileData(title, uploader, file, null);
			
			System.out.printf("%s %s %s", title, uploader, file);
			if(ss.getMapper(DataMapper.class).uploadFile(fd) == 1) {
				req.setAttribute("result", "업로드 성공");
				req.getSession().setAttribute("lastToken", token);
			}		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void getFile(int page, HttpServletRequest req) {
		
		String searchWord = (String) req.getSession().getAttribute("searchWordInFile");
		int fileCount = allFileCount;
		if(searchWord != null) {
			fileCount = getAllFileCount(searchWord);
		}
		else {
			searchWord="";
		}
		fileNumInPage = ia.getPostNumInPage();
		int pageNum = fileCount % fileNumInPage == 0 ?  fileCount / fileNumInPage : fileCount / fileNumInPage + 1;
		int startNum = (page - 1) * fileNumInPage + 1;
		int endNum = startNum + fileNumInPage - 1;
		SearchInfo si = new SearchInfo(startNum, endNum, searchWord);
		
		//List<FileData> files = ss.getMapper(DataMapper.class).getFile();
	}
	
	public void download(FileData fd, HttpServletRequest req, HttpServletResponse res) {
		FileInputStream fis = null;
		ServletOutputStream sos = null;
		try {
			String path = req.getSession().getServletContext().getRealPath("resources/userfiles");
			String file = URLDecoder.decode(fd.getHd_file(), "utf-8");
			fis = new FileInputStream(path + "/" + file);
			
			res.reset();
			
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment; filename=" + fd.getHd_file());
			
			sos = res.getOutputStream();
			
			byte[] b = new byte[4096];
			int data = 0;
			
			while ((data = fis.read(b, 0, b.length)) != -1) {
				sos.write(b, 0, b.length);
			}
			
			sos.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
		try {sos.close();} catch (Exception e) {}
		try {fis.close();} catch (Exception e) {}
		
	}
}
