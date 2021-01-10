package com.ssd.petMate.service;

import com.ssd.petMate.domain.InfoLike;

public interface InfoLikeFacade {
	
	void insertLike(InfoLike infoLike); //좋아요 추가
	
	void deleteLike(InfoLike infoLike); //좋아요 삭제
	
	int countLike(int boardNum);
	
	int isLike(InfoLike infoLike);
}
