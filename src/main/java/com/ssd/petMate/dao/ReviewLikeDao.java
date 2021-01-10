package com.ssd.petMate.dao;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.ReviewLike;

public interface ReviewLikeDao {

	public void insertLike(ReviewLike infoLike) throws DataAccessException; //좋아요 추가
	
	public void deleteLike(ReviewLike infoLike) throws DataAccessException; //좋아요 삭제
	
	public int countLike(int boardNum) throws DataAccessException; //추천 수
	
	public int isLike(ReviewLike infoLike) throws DataAccessException;
}
