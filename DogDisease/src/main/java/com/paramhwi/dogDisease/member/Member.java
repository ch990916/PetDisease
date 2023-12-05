package com.paramhwi.dogDisease.member;

import java.util.Date;

public class Member {
	private String hm_id;
	private String hm_pw;
	private String hm_name;
	private String hm_address;
	private Date hm_birthday;
	private String hm_photo;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String hm_id, String hm_pw, String hm_name, String hm_address, Date hm_birthday, String hm_photo) {
		super();
		this.hm_id = hm_id;
		this.hm_pw = hm_pw;
		this.hm_name = hm_name;
		this.hm_address = hm_address;
		this.hm_birthday = hm_birthday;
		this.hm_photo = hm_photo;
	}

	public String getHm_id() {
		return hm_id;
	}

	public void setHm_id(String hm_id) {
		this.hm_id = hm_id;
	}

	public String getHm_pw() {
		return hm_pw;
	}

	public void setHm_pw(String hm_pw) {
		this.hm_pw = hm_pw;
	}

	public String getHm_name() {
		return hm_name;
	}

	public void setHm_name(String hm_name) {
		this.hm_name = hm_name;
	}

	public String getHm_address() {
		return hm_address;
	}

	public void setHm_address(String hm_address) {
		this.hm_address = hm_address;
	}

	public Date getHm_birthday() {
		return hm_birthday;
	}

	public void setHm_birthday(Date hm_birthday) {
		this.hm_birthday = hm_birthday;
	}

	public String getHm_photo() {
		return hm_photo;
	}

	public void setHm_photo(String hm_photo) {
		this.hm_photo = hm_photo;
	}
	
}
