package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Answer;

public interface AnswerFacade {

	List<Answer> getAnswerList(int boardNum);
	
	void insertAnswer(Answer answer);
	
	void updateAnswer(Answer answer);
	
	void deleteAnswer(int answerNum);
	
	void selectAnswer(int answerNum);
	
	Answer answerDetail(int answerNum);
	
	int answerCnt(int boardNum);
	
	void setAnswerOrder(HashMap<String, Object> map);
	
	int countSameGID(int answerNum);
}
