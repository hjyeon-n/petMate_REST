package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;
import com.ssd.petMate.domain.SecondhandReply;

public interface SecondhandReplyFacade {

	List<SecondhandReply> getReplyList(int boardNum) throws DataAccessException;
	
	void insertReply(SecondhandReply reply) throws DataAccessException;
	
	void updateReply(SecondhandReply reply) throws DataAccessException;
	
	void deleteReply(int replyNum) throws DataAccessException;
	
	SecondhandReply replyDetail(int replyNum) throws DataAccessException;
	
	int replyCnt(int boardNum) throws DataAccessException;
	
	void setReplyOrder(HashMap<String, Object> map) throws DataAccessException;

	int countSameGID(int replyNum)throws DataAccessException;
}
