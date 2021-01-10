package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.PetsitterReply;

public interface PetsitterReplyMapper {

	List<PetsitterReply> getReplyList(int boardNum);
	
	void insertReply(PetsitterReply reply);
	
	void updateReply(PetsitterReply reply);
	
	void deleteReply(int replyNum);
	
	PetsitterReply replyDetail(int replyNum);
	
	int replyCnt(int boardNum);
	
	void setReplyOrder(HashMap<String, Object> map);
	
	int findLastReplyID(int replyNum);
	
	int countSameGID(int replyNum);
	
	void petsitterReplySelect(int replyNum);
}
