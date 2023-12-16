package com.paramhwi.dogDisease.board;

import java.util.Date;
import java.util.List;

public class Post {
	private Integer pp_no;
	private String pp_writer;
	private String pp_picture;
	private String pp_content;
	private Date pp_date;
	
	private String pm_photo;
	private String pm_nickname;
	
	private List<PostReply> pp_replys;
	
	public Post() {
		// TODO Auto-generated constructor stub
	}

	public Post(Integer pp_no, String pp_writer,String pp_picture, String pp_content, Date pp_date, String pm_photo,String pm_nickname,
			List<PostReply> hp_replys) {
		super();
		this.pp_no = pp_no;
		this.pp_writer = pp_writer;
		this.pp_picture = pp_picture;
		this.pp_content = pp_content;
		this.pp_date = pp_date;
		this.pm_photo = pm_photo;
		this.pm_nickname = pm_nickname;
		this.pp_replys = hp_replys;
	}

	public Integer getPp_no() {
		return pp_no;
	}

	public void setPp_no(Integer pp_no) {
		this.pp_no = pp_no;
	}

	public String getPp_writer() {
		return pp_writer;
	}

	public void setPp_writer(String pp_writer) {
		this.pp_writer = pp_writer;
	}
	
	public String getPp_picture() {
		return pp_picture;
	}
	
	public void setPp_picture(String pp_picture) {
		this.pp_picture = pp_picture;
	}

	public String getPp_content() {
		return pp_content;
	}

	public void setPp_content(String pp_content) {
		this.pp_content = pp_content;
	}

	public Date getPp_date() {
		return pp_date;
	}

	public void setPp_date(Date pp_date) {
		this.pp_date = pp_date;
	}

	public String getPm_photo() {
		return pm_photo;
	}

	public void setPm_photo(String pm_photo) {
		this.pm_photo = pm_photo;
	}

	public String getPm_nickname() {
		return pm_nickname;
	}
	
	public void setPm_nickname(String pm_nickname) {
		this.pm_nickname = pm_nickname;
	}
	
	public List<PostReply> getPp_replys() {
		return pp_replys;
	}

	public void setPp_replys(List<PostReply> pp_replys) {
		this.pp_replys = pp_replys;
	}
	
}
