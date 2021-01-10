package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.Controller.FilteringCommand;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.page.BoardSearch;

public interface PetsitterDao {
	List<Petsitter> getAllBoard(BoardSearch boardSearch) throws DataAccessException;
	
	int boardPageCount(HashMap<String, Object> map) throws DataAccessException;
	
	Petsitter boardDetail(int boardNum) throws DataAccessException;
	
	void insertBoard(Petsitter petsitter) throws DataAccessException; //게시글 작성
	
	void deleteBoard(int boardNum) throws DataAccessException; //게시글 삭제
	
	void updateLike(Petsitter petsitter) throws DataAccessException;
	
	void updateReplyCnt(Petsitter petsitter) throws DataAccessException;
	
	void updateBoard(Petsitter petsitter) throws DataAccessException; //게시글 수정
	
	void updateViews(int boardNum) throws DataAccessException; //조회수 증가
	
	List<Petsitter> filtering(FilteringCommand filter) throws DataAccessException;
	
	void selectPetsitter(HashMap<String, Object> map) throws DataAccessException;
	
	int filteringCount(FilteringCommand filter) throws DataAccessException;
}
