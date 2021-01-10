package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Answer;

public interface AnswerMapper {

	List<Answer> getAnswerList(int boardNum);
	
	void insertAnswer(Answer answer);
	
	void updateAnswer(Answer answer);
	
	void deleteAnswer(int answerNum);
	
	void selectAnswer(int answerNum);
	
	Answer answerDetail(int answerNum);
	
	int answerCnt(int boardNum);
	
	void setAnswerOrder(HashMap<String, Object> map);
	
	int findLastAnswerID(int answerNum);
	
	int countSameGID(int answerNum);
}
