package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Answer;

public interface AnswerDao {
	public List<Answer> getAnswerList(int boardNum) throws DataAccessException;
	public Answer answerDetail(int answerNum) throws DataAccessException;
	public void insertAnswer(Answer answer)throws DataAccessException;
	public void updateAnswer(Answer answer)throws DataAccessException;
	public void deleteAnswer(int answerNum)throws DataAccessException;
	public void selectAnswer(int answerNum)throws DataAccessException;
	public int answerCnt(int boardNum) throws DataAccessException;
	public void setAnswerOrder(HashMap<String, Object> map) throws DataAccessException;
	public int countSameGID(int answerNum) throws DataAccessException;
}
