package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GpurchaseReplyDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseReplyMapper;
import com.ssd.petMate.domain.GpurchaseReply;

@Repository
public class MybatisGpurchaseReplyDao implements GpurchaseReplyDao{

	@Autowired
	private GpurchaseReplyMapper gpurchaseReplyMapper;
	
	@Override
	public List<GpurchaseReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyMapper.getReplyList(boardNum);
	}

	@Override
	public GpurchaseReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyMapper.replyDetail(replyNum);
	}

	@Override
	public void insertReply(GpurchaseReply gpurchaseReply) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyMapper.insertReply(gpurchaseReply);
	}

	@Override
	public void updateReply(GpurchaseReply gpurchaseReply) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyMapper.updateReply(gpurchaseReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyMapper.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyMapper.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseReplyMapper.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return gpurchaseReplyMapper.countSameGID(replyNum);
	}
}
