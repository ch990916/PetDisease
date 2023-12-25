package com.paramhwi.dogDisease.board;

public class SearchInfo2 {
	private int startNum;
	private int endNum;
	private String searchWord;
	public SearchInfo2() {
		// TODO Auto-generated constructor stub
	}
	
	public SearchInfo2(int startNum, int endNum, String searchWord) {
		super();
		this.startNum = startNum;
		this.endNum = endNum;
		this.searchWord = searchWord;
	}

	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	
}
