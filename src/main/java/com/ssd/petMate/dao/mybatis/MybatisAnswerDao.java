package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.AnswerDao;
import com.ssd.petMate.dao.mybatis.mapper.AnswerMapper;
import com.ssd.petMate.domain.Answer;

@Repository
public class MybatisAnswerDao implements AnswerDao{

	@Autowired
	private AnswerMapper answerMapper;

	@Override
	public List<Answer> getAnswerList(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return answerMapper.getAnswerList(boardNum);
	}

	@Override
	public Answer answerDetail(int answerNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return answerMapper.answerDetail(answerNum);
	}

	@Override
	public void insertAnswer(Answer answer) throws DataAccessException {
		// TODO Auto-generated method stub
		answerMapper.insertAnswer(answer);
	}

	@Override
	public void updateAnswer(Answer answer) throws DataAccessException {
		// TODO Auto-generated method stub
		answerMapper.updateAnswer(answer);
	}

	@Override
	public void deleteAnswer(int answerNum) throws DataAccessException {
		// TODO Auto-generated method stub
		answerMapper.deleteAnswer(answerNum);
	}
	
	@Override
	public void selectAnswer(int answerNum) throws DataAccessException {
		// TODO Auto-generated method stub
		answerMapper.selectAnswer(answerNum);
	}

	@Override
	public int answerCnt(int boardNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return answerMapper.answerCnt(boardNum);
	}

	@Override
	public void setAnswerOrder(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		answerMapper.setAnswerOrder(map);
	}

	@Override
	public int countSameGID(int answerNum) throws DataAccessException {
		// TODO Auto-generated method stub
		return answerMapper.countSameGID(answerNum);
	}
}
