package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Review;
import com.ssd.petMate.page.BoardSearch;

public interface ReviewDao {
	public List<Review> getAllBoard(BoardSearch boardSearch) throws DataAccessException;
	public int boardPageCount(HashMap<String, Object> map) throws DataAccessException;
	public Review boardDetail(int boardNum) throws DataAccessException;
	public void insertBoard(Review review); //게시글 작성
	public void updateBoard(Review review) throws DataAccessException; //게시글 수정
	public void deleteBoard(int boardNum) throws DataAccessException; //게시글 수정
	public void updateViews(int boardNum);
	public void updateLike(Review review) throws DataAccessException;
	public void updateReplyCnt(Review review) throws DataAccessException;
	public List<String> petsitterChoice(String userID) throws DataAccessException;
	public int petsitterCount(String userID) throws DataAccessException;
}
