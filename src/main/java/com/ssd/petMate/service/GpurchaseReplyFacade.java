package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.GpurchaseReply;

public interface GpurchaseReplyFacade {

	List<GpurchaseReply> getReplyList(int boardNum) throws DataAccessException;
	
	void insertReply(GpurchaseReply reply) throws DataAccessException;
	
	void updateReply(GpurchaseReply reply) throws DataAccessException;
	
	void deleteReply(int replyNum) throws DataAccessException;
	
	GpurchaseReply replyDetail(int replyNum) throws DataAccessException;
	
	int replyCnt(int boardNum) throws DataAccessException;
	
	void setReplyOrder(HashMap<String, Object> map) throws DataAccessException;

	int countSameGID(int replyNum)throws DataAccessException;
}
