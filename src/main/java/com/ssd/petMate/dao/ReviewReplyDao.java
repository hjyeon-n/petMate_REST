package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.ReviewReply;

public interface ReviewReplyDao {
	public List<ReviewReply> getReplyList(int boardNum) throws DataAccessException;
	public ReviewReply replyDetail(int replyNum) throws DataAccessException;
	public void insertReply(ReviewReply reviewReply)throws DataAccessException;
	public void updateReply(ReviewReply reviewReply)throws DataAccessException;
	public void deleteReply(int replyNum)throws DataAccessException;
	public int replyCnt(int boardNum) throws DataAccessException;
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException;
	public int countSameGID(int replyNum) throws DataAccessException;
}
