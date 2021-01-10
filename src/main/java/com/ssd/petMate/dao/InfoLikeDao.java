package com.ssd.petMate.dao;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.InfoLike;

public interface InfoLikeDao {

	public void insertLike(InfoLike infoLike) throws DataAccessException; //좋아요 추가
	
	public void deleteLike(InfoLike infoLike) throws DataAccessException; //좋아요 삭제
	
	public int countLike(int boardNum) throws DataAccessException; //추천 수
	
	public int isLike(InfoLike infoLike) throws DataAccessException;
}
