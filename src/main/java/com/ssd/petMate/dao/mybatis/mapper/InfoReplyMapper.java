package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.InfoReply;

public interface InfoReplyMapper {

	List<InfoReply> getReplyList(int boardNum);
	
	void insertReply(InfoReply reply);
	
	void updateReply(InfoReply reply);
	
	void deleteReply(int replyNum);
	
	InfoReply replyDetail(int replyNum);
	
	int replyCnt(int boardNum);
	
	void setReplyOrder(HashMap<String, Object> map);
	
	int findLastReplyID(int replyNum);
	
	int countSameGID(int replyNum);
}
