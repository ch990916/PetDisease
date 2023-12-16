package com.paramhwi.dogDisease.board;

import java.util.List;

public interface PostMapper {
	public abstract int writePost(Post p);
	
	public abstract List<Post> searchPage(SearchInfo si);
	
	public abstract Post searchContent(Post p);
	
	public abstract int getAllPostCount(SearchInfo si);
	
	public abstract int writeReply(PostReply pr);
	
	public abstract List<PostReply> getReply(Post p);
	
	public abstract int deletePost(Post p);
	
	public abstract int updatePost(Post p);
}
