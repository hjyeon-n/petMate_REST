package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Review;
import com.ssd.petMate.page.BoardSearch;

public interface ReviewFacade {
	List<Review> getAllBoard(BoardSearch boardSearch);
	int boardPageCount(HashMap<String, Object> map);
	Review boardDetail(int boardNum);
	public void insertBoard(Review review); //게시글 작성
	public void updateBoard(Review review) throws DataAccessException; //게시글 수정
	public void deleteBoard(int boardNum) throws DataAccessException; //게시글 삭제
	public void updateViews(int boardNum);
	void updateLike(Review review);
	void updateReplyCnt(Review review);
	List<String> petsitterChoice(String userID);
	public int petsitterCount(String userID);
}
