package com.paramhwi.dogDisease;

public class IntegratedAttribute {
	private int postNumInPage;
	private int fileNumInPage;


	public IntegratedAttribute() {
		// TODO Auto-generated constructor stub
	}
	

	public IntegratedAttribute(int postNumInPage, int fileNumInPage) {
		super();
		this.postNumInPage = postNumInPage;
		this.fileNumInPage = fileNumInPage;
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
	
}
