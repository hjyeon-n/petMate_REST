package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.InfoReply;

public interface InfoReplyDao {
	public List<InfoReply> getReplyList(int boardNum) throws DataAccessException;
	public InfoReply replyDetail(int replyNum) throws DataAccessException;
	public void insertReply(InfoReply infoReply)throws DataAccessException;
	public void updateReply(InfoReply infoReply)throws DataAccessException;
	public void deleteReply(int replyNum)throws DataAccessException;
	public int replyCnt(int boardNum) throws DataAccessException;
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException;
	public int countSameGID(int replyNum) throws DataAccessException;
}
