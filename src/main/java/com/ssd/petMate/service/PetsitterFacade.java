package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.Controller.FilteringCommand;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.page.BoardSearch;

public interface PetsitterFacade {
	
	List<Petsitter> getAllBoard(BoardSearch boardSearch);

	int boardPageCount(HashMap<String, Object> map);

	Petsitter boardDetail(int boardNum);
	
	void insertBoard(Petsitter petsitter);
	
	void deleteBoard(int boardNum);

	void updateLike(Petsitter petsitter);
	
	void updateReplyCnt(Petsitter petsitter) ;
	
	void updateBoard(Petsitter petsitter) throws DataAccessException;

	void updateViews(int boardNum);

	List<Petsitter> filtering(FilteringCommand filter);

	void selectPetsitter(HashMap<String, Object> map);
	
	int filteringCount(FilteringCommand filter);
}
