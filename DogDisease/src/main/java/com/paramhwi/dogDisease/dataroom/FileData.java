package com.paramhwi.dogDisease.dataroom;

import java.util.Date;

public class FileData {
	private String hd_title;
	private String hd_uploader;
	private String hd_file;
	private Date hd_date;
	
	public FileData() {
		// TODO Auto-generated constructor stub
	}

	public FileData(String hd_title, String hd_uploader, String hd_file, Date hd_date) {
		super();
		this.hd_title = hd_title;
		this.hd_uploader = hd_uploader;
		this.hd_file = hd_file;
		this.hd_date = hd_date;
	}

	public String getHd_title() {
		return hd_title;
	}

	public void setHd_title(String hd_title) {
		this.hd_title = hd_title;
	}

	public String getHd_uploader() {
		return hd_uploader;
	}

	public void setHd_uploader(String hd_uploader) {
		this.hd_uploader = hd_uploader;
	}

	public String getHd_file() {
		return hd_file;
	}

	public void setHd_file(String hd_file) {
		this.hd_file = hd_file;
	}

	public Date getHd_date() {
		return hd_date;
	}

	public void setHd_date(Date hd_date) {
		this.hd_date = hd_date;
	}
	
}
