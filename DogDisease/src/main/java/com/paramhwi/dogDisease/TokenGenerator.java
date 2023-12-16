package com.paramhwi.dogDisease;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

@Service
public class TokenGenerator {
	private SimpleDateFormat sdf;
	
	public TokenGenerator() {
		sdf = new SimpleDateFormat("yyyyMMddHHmmssSS");
	}
	public void generate(HttpServletRequest req) {
		String token = sdf.format(new Date());
		req.setAttribute("token", token);
		System.out.println(token);
	}
}
