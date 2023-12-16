package com.paramhwi.dogDisease.board;

import java.util.Date;

public class PostReply {
	private Integer pr_no;
	private Integer pr_pp_no;
	private String pr_writer;
	private String pr_content;
	private Date pr_date;
	
	public PostReply() {
		// TODO Auto-generated constructor stub
	}

	public PostReply(Integer pr_no, Integer pr_pp_no, String pr_writer, String pr_content, Date pr_date) {
		super();
		this.pr_no = pr_no;
		this.pr_pp_no = pr_pp_no;
		this.pr_writer = pr_writer;
		this.pr_content = pr_content;
		this.pr_date = pr_date;
	}

	public Integer getPr_no() {
		return pr_no;
	}

	public void setPr_no(Integer pr_no) {
		this.pr_no = pr_no;
	}

	public Integer getPr_pp_no() {
		return pr_pp_no;
	}

	public void setPr_pp_no(Integer pr_pp_no) {
		this.pr_pp_no = pr_pp_no;
	}

	public String getPr_writer() {
		return pr_writer;
	}

	public void setPr_writer(String pr_writer) {
		this.pr_writer = pr_writer;
	}

	public String getPr_content() {
		return pr_content;
	}

	public void setPr_content(String pr_content) {
		this.pr_content = pr_content;
	}

	public Date getPr_date() {
		return pr_date;
	}

	public void setPr_date(Date pr_date) {
		this.pr_date = pr_date;
	}
	
}
