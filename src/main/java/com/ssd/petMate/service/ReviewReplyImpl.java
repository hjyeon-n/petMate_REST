package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.ReviewReplyDao;
import com.ssd.petMate.domain.ReviewReply;

@Service
@Transactional
public class ReviewReplyImpl implements ReviewReplyFacade{

	@Autowired
	private ReviewReplyDao reviewReplyDao;
	
	@Override
	public List<ReviewReply> getReplyList(int boardNum) {
		// TODO Auto-generated method stub
		return reviewReplyDao.getReplyList(boardNum);
	}

	@Override
	public void insertReply(ReviewReply reviewReply) {
		// TODO Auto-generated method stub
		reviewReplyDao.insertReply(reviewReply);
	}

	@Override
	public void updateReply(ReviewReply reviewReply) {
		// TODO Auto-generated method stub
		reviewReplyDao.updateReply(reviewReply);
	}

	@Override
	public void deleteReply(int replyNum) {
		// TODO Auto-generated method stub
		reviewReplyDao.deleteReply(replyNum);
	}

	@Override
	public ReviewReply replyDetail(int replyNum) {
		// TODO Auto-generated method stub
		return reviewReplyDao.replyDetail(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) {
		// TODO Auto-generated method stub
		return reviewReplyDao.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		reviewReplyDao.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) {
		// TODO Auto-generated method stub
		return 0;
	}
}
