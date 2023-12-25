package com.paramhwi.dogDisease.board;

import java.util.List;

public class Replys {
	private List<PostReply> reply;
	public Replys() {
		// TODO Auto-generated constructor stub
	}
	public Replys(List<PostReply> reply) {
		super();
		this.reply = reply;
	}
	public List<PostReply> getReply() {
		return reply;
	}
	public void setReply(List<PostReply> reply) {
		this.reply = reply;
	}
	
}
