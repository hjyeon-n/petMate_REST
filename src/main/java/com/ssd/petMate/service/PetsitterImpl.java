package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.Controller.FilteringCommand;
import com.ssd.petMate.dao.PetsitterDao;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class PetsitterImpl implements PetsitterFacade {
	
	@Autowired
	private PetsitterDao petsitterDao;
	
	@Override
	public List<Petsitter> getAllBoard(BoardSearch boardSearch) {
		return petsitterDao.getAllBoard(boardSearch);
	}

	@Override
	public int boardPageCount(HashMap<String, Object> map) {
		return petsitterDao.boardPageCount(map);
	}

	@Override
	public Petsitter boardDetail(int boardNum) {
		return petsitterDao.boardDetail(boardNum);
	}
	
	public void insertBoard(Petsitter petsitter) {
		petsitterDao.insertBoard(petsitter);
	}
	
	public void deleteBoard(int boardNum) {
		petsitterDao.deleteBoard(boardNum);
	}

	@Override
	public void updateLike(Petsitter petsitter) {
		petsitterDao.updateLike(petsitter);
	}

	@Override
	public void updateReplyCnt(Petsitter petsitter) {
		petsitterDao.updateReplyCnt(petsitter);
	}

	@Override
	public void updateBoard(Petsitter petsitter) throws DataAccessException {
		petsitterDao.updateBoard(petsitter);	
	}

	@Override
	public void updateViews(int boardNum) {
		petsitterDao.updateViews(boardNum);
	}

	@Override
	public List<Petsitter> filtering(FilteringCommand filter) {
		return petsitterDao.filtering(filter);
	}

	@Override
	public void selectPetsitter(HashMap<String, Object> map) {
		petsitterDao.selectPetsitter(map);
	}

	@Override
	public int filteringCount(FilteringCommand filter) {
		return petsitterDao.filteringCount(filter);
	}
}
