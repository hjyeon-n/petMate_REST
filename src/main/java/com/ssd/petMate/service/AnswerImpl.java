package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.AnswerDao;
import com.ssd.petMate.domain.Answer;

@Service
@Transactional
public class AnswerImpl implements AnswerFacade{

	@Autowired
	private AnswerDao answerDao;

	@Override
	public List<Answer> getAnswerList(int boardNum) {
		// TODO Auto-generated method stub
		return answerDao.getAnswerList(boardNum);
	}

	@Override
	public void insertAnswer(Answer answer) {
		// TODO Auto-generated method stub
		answerDao.insertAnswer(answer);
	}

	@Override
	public void updateAnswer(Answer answer) {
		// TODO Auto-generated method stub
		answerDao.updateAnswer(answer);
	}

	@Override
	public void deleteAnswer(int answerNum) {
		// TODO Auto-generated method stub
		answerDao.deleteAnswer(answerNum);
	}
	
	@Override
	public void selectAnswer(int answerNum) {
		// TODO Auto-generated method stub
		answerDao.selectAnswer(answerNum);
	}

	@Override
	public Answer answerDetail(int answerNum) {
		// TODO Auto-generated method stub
		return answerDao.answerDetail(answerNum);
	}

	@Override
	public int answerCnt(int boardNum) {
		// TODO Auto-generated method stub
		return answerDao.answerCnt(boardNum);
	}

	@Override
	public void setAnswerOrder(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		answerDao.setAnswerOrder(map);
	}

	@Override
	public int countSameGID(int answerNum) {
		// TODO Auto-generated method stub
		return answerDao.countSameGID(answerNum);
	}
}
