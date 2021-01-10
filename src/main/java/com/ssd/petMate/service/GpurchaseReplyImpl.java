package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.GpurchaseReplyDao;
import com.ssd.petMate.domain.GpurchaseReply;

@Service
@Transactional
public class GpurchaseReplyImpl implements GpurchaseReplyFacade{

	@Autowired
	private GpurchaseReplyDao gpurchaseReplyDao;
	
	@Override
	public List<GpurchaseReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyDao.getReplyList(boardNum);
	}

	@Override
	public GpurchaseReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyDao.replyDetail(replyNum);
	}

	@Override
	public void insertReply(GpurchaseReply gpurchaseReply) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyDao.insertReply(gpurchaseReply);
	}

	@Override
	public void updateReply(GpurchaseReply gpurchaseReply) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyDao.updateReply(gpurchaseReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyDao.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyDao.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyDao.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyDao.countSameGID(replyNum);
	}
}
