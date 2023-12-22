package com.paramhwi.dogDisease;

public class IntegratedAttribute {
	private int postNumInPage;
	private int noticeNumInPage;


	public IntegratedAttribute() {
		// TODO Auto-generated constructor stub
	}
	

	public IntegratedAttribute(int postNumInPage, int noticeNumInPage) {
		super();
		this.postNumInPage = postNumInPage;
		this.noticeNumInPage = noticeNumInPage;
	}


	public int getPostNumInPage() {
		return postNumInPage;
	}

	public void setPostNumInPage(int postNumInPage) {
		this.postNumInPage = postNumInPage;
	}
	


	public int getNoticeNumInPage() {
		return noticeNumInPage;
	}


	public void setNoticeNumInPage(int noticeNumInPage) {
		this.noticeNumInPage = noticeNumInPage;
	}
	
}
