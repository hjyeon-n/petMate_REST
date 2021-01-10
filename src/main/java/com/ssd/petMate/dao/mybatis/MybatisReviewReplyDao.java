package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.ReviewReplyDao;
import com.ssd.petMate.dao.mybatis.mapper.ReviewReplyMapper;
import com.ssd.petMate.domain.ReviewReply;

@Repository
public class MybatisReviewReplyDao implements ReviewReplyDao{

	@Autowired
	private ReviewReplyMapper reviewReplyMapper;
	
	@Override
	public List<ReviewReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return reviewReplyMapper.getReplyList(boardNum);
	}

	@Override
	public ReviewReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return reviewReplyMapper.replyDetail(replyNum);
	}

	@Override
	public void insertReply(ReviewReply reviewReply) throws DataAccessException {
		// TODO Auto-generated method stub
		reviewReplyMapper.insertReply(reviewReply);
	}

	@Override
	public void updateReply(ReviewReply reviewReply) throws DataAccessException {
		// TODO Auto-generated method stub
		reviewReplyMapper.updateReply(reviewReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		reviewReplyMapper.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return reviewReplyMapper.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		reviewReplyMapper.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return reviewReplyMapper.countSameGID(replyNum);
	}
}
