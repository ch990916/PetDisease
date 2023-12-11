package com.paramhwi.dogDisease.member;

import java.math.BigDecimal;
import java.util.Date;

public class Member {
	private String pm_id;
	private String pm_pw;
	private String pm_nickname;
	private String pm_address;
	private Date pm_birthday;
	private String pm_photo;
	private String pm_mail;
	private BigDecimal pm_admin;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(String pm_id, String pm_pw, String pm_nickname, String pm_address, Date pm_birthday, String pm_photo,
			String pm_mail, BigDecimal pm_admin) {
		super();
		this.pm_id = pm_id;
		this.pm_pw = pm_pw;
		this.pm_nickname = pm_nickname;
		this.pm_address = pm_address;
		this.pm_birthday = pm_birthday;
		this.pm_photo = pm_photo;
		this.pm_mail = pm_mail;
		this.pm_admin = pm_admin;
	}

	public String getPm_id() {
		return pm_id;
	}

	public void setPm_id(String pm_id) {
		this.pm_id = pm_id;
	}

	public String getPm_pw() {
		return pm_pw;
	}

	public void setPm_pw(String pm_pw) {
		this.pm_pw = pm_pw;
	}

	public String getPm_nickname() {
		return pm_nickname;
	}

	public void setPm_nickname(String pm_nickname) {
		this.pm_nickname = pm_nickname;
	}

	public String getPm_address() {
		return pm_address;
	}

	public void setPm_address(String pm_address) {
		this.pm_address = pm_address;
	}

	public Date getPm_birthday() {
		return pm_birthday;
	}

	public void setPm_birthday(Date pm_birthday) {
		this.pm_birthday = pm_birthday;
	}

	public String getPm_photo() {
		return pm_photo;
	}

	public void setPm_photo(String pm_photo) {
		this.pm_photo = pm_photo;
	}

	public String getPm_mail() {
		return pm_mail;
	}

	public void setPm_mail(String pm_mail) {
		this.pm_mail = pm_mail;
	}

	public BigDecimal getPm_admin() {
		return pm_admin;
	}

	public void setPm_admin(BigDecimal pm_admin) {
		this.pm_admin = pm_admin;
	}

	
}
