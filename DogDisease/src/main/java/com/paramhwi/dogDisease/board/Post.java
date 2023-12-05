package com.paramhwi.dogDisease.board;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

public class Post {
	private BigDecimal hp_no;
	private String hp_title;
	private String hp_writer;
	private String hp_content;
	private Date hp_date;
	
	private String hm_photo;
	
	private List<PostReply> hp_replys;
	
	public Post() {
		// TODO Auto-generated constructor stub
	}

	public Post(BigDecimal hp_no, String hp_title, String hp_writer, String hp_content, Date hp_date, String hm_photo,
			List<PostReply> hp_replys) {
		super();
		this.hp_no = hp_no;
		this.hp_title = hp_title;
		this.hp_writer = hp_writer;
		this.hp_content = hp_content;
		this.hp_date = hp_date;
		this.hm_photo = hm_photo;
		this.hp_replys = hp_replys;
	}




	public BigDecimal getHp_no() {
		return hp_no;
	}

	public void setHp_no(BigDecimal hp_no) {
		this.hp_no = hp_no;
	}

	public String getHp_title() {
		return hp_title;
	}

	public void setHp_title(String hp_title) {
		this.hp_title = hp_title;
	}

	public String getHp_writer() {
		return hp_writer;
	}

	public void setHp_writer(String hp_writer) {
		this.hp_writer = hp_writer;
	}

	public String getHp_content() {
		return hp_content;
	}

	public void setHp_content(String hp_content) {
		this.hp_content = hp_content;
	}

	public Date getHp_date() {
		return hp_date;
	}

	public void setHp_date(Date hp_date) {
		this.hp_date = hp_date;
	}

	public String getHm_photo() {
		return hm_photo;
	}

	public void setHm_photo(String hm_photo) {
		this.hm_photo = hm_photo;
	}

	public List<PostReply> getHp_replys() {
		return hp_replys;
	}

	public void setHp_replys(List<PostReply> hp_replys) {
		this.hp_replys = hp_replys;
	}
	
}
