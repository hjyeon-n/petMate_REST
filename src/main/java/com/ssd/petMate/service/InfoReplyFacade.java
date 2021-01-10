package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.InfoReply;

public interface InfoReplyFacade {

	List<InfoReply> getReplyList(int boardNum);
	
	void insertReply(InfoReply reply);
	
	void updateReply(InfoReply reply);
	
	void deleteReply(int replyNum);
	
	InfoReply replyDetail(int replyNum);
	
	int replyCnt(int boardNum);
	
	void setReplyOrder(HashMap<String, Object> map);
	
	int countSameGID(int replyNum);
}
