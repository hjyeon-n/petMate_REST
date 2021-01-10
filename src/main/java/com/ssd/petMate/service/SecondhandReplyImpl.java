package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.SecondhandReplyDao;
import com.ssd.petMate.domain.SecondhandReply;

@Service
@Transactional
public class SecondhandReplyImpl implements SecondhandReplyFacade{

	@Autowired
	private SecondhandReplyDao secondhandReplyDao;
	
	@Override
	public List<SecondhandReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyDao.getReplyList(boardNum);
	}

	@Override
	public SecondhandReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyDao.replyDetail(replyNum);
	}

	@Override
	public void insertReply(SecondhandReply secondhandReply) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyDao.insertReply(secondhandReply);
	}

	@Override
	public void updateReply(SecondhandReply secondhandReply) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyDao.updateReply(secondhandReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyDao.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyDao.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyDao.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyDao.countSameGID(replyNum);
	}
}
