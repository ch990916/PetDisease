package com.paramhwi.dogDisease.board;

import java.math.BigDecimal;
import java.util.Date;

public class PostReply {
	private BigDecimal hpr_no;
	private BigDecimal hpr_hp_no;
	private String hpr_writer;
	private String hpr_content;
	private Date hpr_date;
	public PostReply() {
		// TODO Auto-generated constructor stub
	}
	public PostReply(BigDecimal hpr_no, BigDecimal hpr_hp_no, String hpr_writer, String hpr_content, Date hpr_date) {
		super();
		this.hpr_no = hpr_no;
		this.hpr_hp_no = hpr_hp_no;
		this.hpr_writer = hpr_writer;
		this.hpr_content = hpr_content;
		this.hpr_date = hpr_date;
	}
	public BigDecimal getHpr_no() {
		return hpr_no;
	}
	public void setHpr_no(BigDecimal hpr_no) {
		this.hpr_no = hpr_no;
	}
	public BigDecimal getHpr_hp_no() {
		return hpr_hp_no;
	}
	public void setHpr_hp_no(BigDecimal hpr_hp_no) {
		this.hpr_hp_no = hpr_hp_no;
	}
	public String getHpr_writer() {
		return hpr_writer;
	}
	public void setHpr_writer(String hpr_writer) {
		this.hpr_writer = hpr_writer;
	}
	public String getHpr_content() {
		return hpr_content;
	}
	public void setHpr_content(String hpr_content) {
		this.hpr_content = hpr_content;
	}
	public Date getHpr_date() {
		return hpr_date;
	}
	public void setHpr_date(Date hpr_date) {
		this.hpr_date = hpr_date;
	}
	
}
