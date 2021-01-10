package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.PetsitterReplyDao;
import com.ssd.petMate.domain.PetsitterReply;

@Service
@Transactional
public class PetsitterReplyImpl implements PetsitterReplyFacade{
	@Autowired
	private PetsitterReplyDao petsitterReplyDao;
	
	@Override
	public List<PetsitterReply> getReplyList(int boardNum) {
		// TODO Auto-generated method stub
		return petsitterReplyDao.getReplyList(boardNum);
	}

	@Override
	public void insertReply(PetsitterReply reply) {
		// TODO Auto-generated method stub
		petsitterReplyDao.insertReply(reply);
	}

	@Override
	public void updateReply(PetsitterReply reply) {
		// TODO Auto-generated method stub
		petsitterReplyDao.updateReply(reply);
	}

	@Override
	public void deleteReply(int replyNum) {
		// TODO Auto-generated method stub
		petsitterReplyDao.deleteReply(replyNum);
	}

	@Override
	public PetsitterReply replyDetail(int replyNum) {
		// TODO Auto-generated method stub
		return petsitterReplyDao.replyDetail(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) {
		// TODO Auto-generated method stub
		return petsitterReplyDao.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		petsitterReplyDao.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void petsitterReplySelect(int replyNum) {
		petsitterReplyDao.petsitterReplySelect(replyNum);
	}
}
