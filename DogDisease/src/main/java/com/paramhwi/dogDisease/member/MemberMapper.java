package com.paramhwi.dogDisease.member;

import java.util.List;

public interface MemberMapper {
	public abstract int joinMember(Member m);
	
	public abstract Member getMemberByID(Member m);
	
	public abstract List<Member> getMemberByID2(Member m);
	
	public abstract int deleteMember(Member m);
	
	public abstract int updateMember(Member m);
	
	public abstract int getPostCount(Member m);

}
