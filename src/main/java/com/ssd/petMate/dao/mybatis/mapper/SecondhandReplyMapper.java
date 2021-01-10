package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.GpurchaseReply;
import com.ssd.petMate.domain.SecondhandReply;
import com.ssd.petMate.page.pageMaker;

public interface SecondhandReplyMapper {

	List<SecondhandReply> getReplyList(int boardNum);
	
	void insertReply(SecondhandReply reply);
	
	void updateReply(SecondhandReply reply);
	
	void deleteReply(int replyNum);
	
	SecondhandReply replyDetail(int replyNum);
	
	int replyCnt(int boardNum);
	
	void setReplyOrder(HashMap<String, Object> map);
	
	int findLastReplyID(int replyNum);
	
	int countSameGID(int replyNum);
}
