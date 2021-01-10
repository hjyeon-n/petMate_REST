package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.PetsitterReply;

public interface PetsitterReplyDao {
	List<PetsitterReply> getReplyList(int boardNum) throws DataAccessException;
	
	PetsitterReply replyDetail(int replyNum) throws DataAccessException;
	
	void insertReply(PetsitterReply petsitterReply)throws DataAccessException;
	
	void updateReply(PetsitterReply petsitterReply)throws DataAccessException;
	
	void deleteReply(int replyNum)throws DataAccessException;
	
	int replyCnt(int boardNum) throws DataAccessException;
	
	void setReplyOrder(HashMap<String, Object> map) throws DataAccessException;
	
	int countSameGID(int replyNum) throws DataAccessException;
	
	void petsitterReplySelect(int replyNum) throws DataAccessException;
}
