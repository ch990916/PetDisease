package com.paramhwi.dogDisease.notice;

import java.util.List;

import com.paramhwi.dogDisease.SearchInfo;

public interface NoticeMapper {
	public abstract int writeNotice(Notice n);
	
	public abstract int modifyNotice(Notice n);
	
	public abstract List<Notice> searchNoticePage(SearchInfo si);
	
	public abstract Notice searchNoticeContent(Notice n);
	
	public abstract int getAllNoticeCount(SearchInfo si);
	
	public abstract int deleteNotice(Notice n);
}
