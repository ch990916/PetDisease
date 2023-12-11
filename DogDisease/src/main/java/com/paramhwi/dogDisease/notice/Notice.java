package com.paramhwi.dogDisease.notice;

import java.math.BigDecimal;
import java.util.Date;

public class Notice {
	private BigDecimal pn_no;
	private String pn_title;
	private String pn_writer;
	private String pn_content;
	private Date pn_date;
	
	private String pm_photo;
	private String pm_nickname;
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}

	public Notice(BigDecimal pn_no, String pn_title, String pn_writer, String pn_content, Date pn_date, String pm_photo,
			String pm_nickname) {
		super();
		this.pn_no = pn_no;
		this.pn_title = pn_title;
		this.pn_writer = pn_writer;
		this.pn_content = pn_content;
		this.pn_date = pn_date;
		this.pm_photo = pm_photo;
		this.pm_nickname = pm_nickname;
	}

	public BigDecimal getPn_no() {
		return pn_no;
	}

	public void setPn_no(BigDecimal pn_no) {
		this.pn_no = pn_no;
	}

	public String getPn_title() {
		return pn_title;
	}

	public void setPn_title(String pn_title) {
		this.pn_title = pn_title;
	}

	public String getPn_writer() {
		return pn_writer;
	}

	public void setPn_writer(String pn_writer) {
		this.pn_writer = pn_writer;
	}

	public String getPn_content() {
		return pn_content;
	}

	public void setPn_content(String pn_content) {
		this.pn_content = pn_content;
	}

	public Date getPn_date() {
		return pn_date;
	}

	public void setPn_date(Date pn_date) {
		this.pn_date = pn_date;
	}

	public String getPm_photo() {
		return pm_photo;
	}

	public void setPm_photo(String pm_photo) {
		this.pm_photo = pm_photo;
	}

	public String getPm_nickname() {
		return pm_nickname;
	}

	public void setPm_nickname(String pm_nickname) {
		this.pm_nickname = pm_nickname;
	}
	
}
