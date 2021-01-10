package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.InfoReplyDao;
import com.ssd.petMate.domain.InfoReply;

@Service
@Transactional
public class InfoReplyImpl implements InfoReplyFacade{

	@Autowired
	private InfoReplyDao infoReplyDao;
	
	@Override
	public List<InfoReply> getReplyList(int boardNum) {
		// TODO Auto-generated method stub
		return infoReplyDao.getReplyList(boardNum);
	}

	@Override
	public void insertReply(InfoReply reply) {
		// TODO Auto-generated method stub
		infoReplyDao.insertReply(reply);
	}

	@Override
	public void updateReply(InfoReply reply) {
		// TODO Auto-generated method stub
		infoReplyDao.updateReply(reply);
	}

	@Override
	public void deleteReply(int replyNum) {
		// TODO Auto-generated method stub
		infoReplyDao.deleteReply(replyNum);
	}

	@Override
	public InfoReply replyDetail(int replyNum) {
		// TODO Auto-generated method stub
		return infoReplyDao.replyDetail(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) {
		// TODO Auto-generated method stub
		return infoReplyDao.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		infoReplyDao.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) {
		// TODO Auto-generated method stub
		return 0;
	}
}
