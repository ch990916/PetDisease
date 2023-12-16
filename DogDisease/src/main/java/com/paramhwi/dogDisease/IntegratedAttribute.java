package com.paramhwi.dogDisease;

public class IntegratedAttribute {
	private int postNumInPage;
	private int fileNumInPage;
	private int noticeNumInPage;

	public IntegratedAttribute() {
		// TODO Auto-generated constructor stub
	}
	

	public IntegratedAttribute(int postNumInPage, int fileNumInPage, int noticeNumInPage) {
		super();
		this.postNumInPage = postNumInPage;
		this.fileNumInPage = fileNumInPage;
		this.noticeNumInPage = noticeNumInPage;
	}


	public int getPostNumInPage() {
		return postNumInPage;
	}

	public void setPostNumInPage(int postNumInPage) {
		this.postNumInPage = postNumInPage;
	}


	public int getFileNumInPage() {
		return fileNumInPage;
	}


	public void setFileNumInPage(int fileNumInPage) {
		this.fileNumInPage = fileNumInPage;
	}
	
	public void setNoticeNumInPage(int noticeNumInPage) {
		this.noticeNumInPage = noticeNumInPage;
	}
	
	public int getNoticeNumInPage() {
		return noticeNumInPage;
	}
}
