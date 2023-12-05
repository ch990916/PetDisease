package com.paramhwi.dogDisease.dataroom;

import com.paramhwi.dogDisease.board.SearchInfo;

public interface DataMapper {
	public abstract int uploadFile(FileData fd);
	
	public abstract int getAllFileCount(SearchInfo si);
}
