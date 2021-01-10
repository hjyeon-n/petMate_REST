package com.ssd.petMate.dao;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.PetsitterLike;

public interface PetsitterLikeDao {
	void insertLike(PetsitterLike petsitterLike) throws DataAccessException; //좋아요 추가
	
	void deleteLike(PetsitterLike petsitterLike) throws DataAccessException; //좋아요 삭제
	
	int countLike(int boardNum) throws DataAccessException; //추천 수
	
	int isLike(PetsitterLike petsitterLike) throws DataAccessException;
}
