package com.ssd.petMate.service;

import com.ssd.petMate.domain.PetsitterLike;

public interface PetsitterLikeFacade {
	void insertLike(PetsitterLike petsitterLike); //좋아요 추가
	
	void deleteLike(PetsitterLike infoLike); //좋아요 삭제
	
	int countLike(int boardNum);
	
	int isLike(PetsitterLike petsitterLike);
}
