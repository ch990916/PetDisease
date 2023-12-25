package com.paramhwi.dogDisease.notice;

import java.util.List;

<<<<<<< HEAD
import com.paramhwi.dogDisease.SearchInfo;
=======
import com.paramhwi.dogDisease.board.SearchInfo;
>>>>>>> origin/branch_JinMyeong

public interface NoticeMapper {
	public abstract int writeNotice(Notice n);
	
<<<<<<< HEAD
	public abstract int modifyNotice(Notice n);
	
=======
>>>>>>> origin/branch_JinMyeong
	public abstract List<Notice> searchNoticePage(SearchInfo si);
	
	public abstract Notice searchNoticeContent(Notice n);
	
	public abstract int getAllNoticeCount(SearchInfo si);
	
	public abstract int deleteNotice(Notice n);
<<<<<<< HEAD
=======
	
	public abstract int updateNotice(Notice n);
>>>>>>> origin/branch_JinMyeong
}
