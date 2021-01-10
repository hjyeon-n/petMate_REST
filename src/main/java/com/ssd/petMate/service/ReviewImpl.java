package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.ReviewDao;
import com.ssd.petMate.domain.Review;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class ReviewImpl implements ReviewFacade { 
	@Autowired
	private ReviewDao reviewDao;

	public List<Review> getAllBoard(BoardSearch boardSearch){
		return reviewDao.getAllBoard(boardSearch);
	}
	
	public int boardPageCount(HashMap<String, Object> map) {
		return reviewDao.boardPageCount(map);
	}
	
	public Review boardDetail(int boardNum) {
		return reviewDao.boardDetail(boardNum);
	}

	public void insertBoard(Review review) {
		reviewDao.insertBoard(review);
	}
	
	public void updateBoard(Review review) throws DataAccessException{
		reviewDao.updateBoard(review);
	}
	
	public void deleteBoard(int boardNum) throws DataAccessException{
		reviewDao.deleteBoard(boardNum);
	}
	
	public void updateViews(int boardNum) throws DataAccessException{
		reviewDao.updateViews(boardNum);
	}
	
	public void updateLike(Review review) {
		reviewDao.updateLike(review);
	}

	public void updateReplyCnt(Review review) {
		reviewDao.updateReplyCnt(review);
	}
	
	public List<String> petsitterChoice(String userID) {
		return reviewDao.petsitterChoice(userID);
	}
	
	public int petsitterCount(String userID) {
		return reviewDao.petsitterCount(userID);
	}
}