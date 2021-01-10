package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.InfoReplyDao;
import com.ssd.petMate.dao.mybatis.mapper.InfoReplyMapper;
import com.ssd.petMate.domain.InfoReply;

@Repository
public class MybatisInfoReplyDao implements InfoReplyDao{

	@Autowired
	private InfoReplyMapper infoReplyMapper;
	
	@Override
	public List<InfoReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return infoReplyMapper.getReplyList(boardNum);
	}

	@Override
	public InfoReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return infoReplyMapper.replyDetail(replyNum);
	}

	@Override
	public void insertReply(InfoReply infoReply) throws DataAccessException {
		// TODO Auto-generated method stub
		infoReplyMapper.insertReply(infoReply);
	}

	@Override
	public void updateReply(InfoReply infoReply) throws DataAccessException {
		// TODO Auto-generated method stub
		infoReplyMapper.updateReply(infoReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		infoReplyMapper.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return infoReplyMapper.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		infoReplyMapper.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return infoReplyMapper.countSameGID(replyNum);
	}
}
