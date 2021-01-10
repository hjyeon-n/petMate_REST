package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.PetsitterReplyDao;
import com.ssd.petMate.dao.mybatis.mapper.PetsitterReplyMapper;
import com.ssd.petMate.domain.PetsitterReply;

@Repository
public class MybatisPetsitterReplyDao implements PetsitterReplyDao{
	@Autowired
	private PetsitterReplyMapper petsitterReplyMapper;
	
	@Override
	public List<PetsitterReply> getReplyList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return petsitterReplyMapper.getReplyList(boardNum);
	}

	@Override
	public PetsitterReply replyDetail(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return petsitterReplyMapper.replyDetail(replyNum);
	}

	@Override
	public void insertReply(PetsitterReply infoReply) throws DataAccessException {
		// TODO Auto-generated method stub
		petsitterReplyMapper.insertReply(infoReply);
	}

	@Override
	public void updateReply(PetsitterReply infoReply) throws DataAccessException {
		// TODO Auto-generated method stub
		petsitterReplyMapper.updateReply(infoReply);
	}

	@Override
	public void deleteReply(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		petsitterReplyMapper.deleteReply(replyNum);
	}

	@Override
	public int replyCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return petsitterReplyMapper.replyCnt(boardNum);
	}

	@Override
	public void setReplyOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		petsitterReplyMapper.setReplyOrder(map);
	}

	@Override
	public int countSameGID(int replyNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return petsitterReplyMapper.countSameGID(replyNum);
	}

	@Override
	public void petsitterReplySelect(int replyNum) throws DataAccessException {
		petsitterReplyMapper.petsitterReplySelect(replyNum);
	}
}
