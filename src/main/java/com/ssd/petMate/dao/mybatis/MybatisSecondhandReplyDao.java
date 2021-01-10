package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GpurchaseReplyDao;
import com.ssd.petMate.dao.SecondhandReplyDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseReplyMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandReplyMapper;
import com.ssd.petMate.domain.GpurchaseReply;
import com.ssd.petMate.domain.SecondhandReply;

@Repository
public class MybatisSecondhandReplyDao implements SecondhandReplyDao{

	@Autowired
	private SecondhandReplyMapper secondhandReplyMapper;
	
	@Override
	public List<SecondhandReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyMapper.getReplyList(boardNum);
	}

	@Override
	public SecondhandReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyMapper.replyDetail(replyNum);
	}

	@Override
	public void insertReply(SecondhandReply secondhandReply) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyMapper.insertReply(secondhandReply);
	}

	@Override
	public void updateReply(SecondhandReply secondhandReply) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyMapper.updateReply(secondhandReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyMapper.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyMapper.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		secondhandReplyMapper.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return secondhandReplyMapper.countSameGID(replyNum);
	}
}
