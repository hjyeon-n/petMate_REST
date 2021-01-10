package com.ssd.petMate.service;

import com.ssd.petMate.domain.ReviewLike;

public interface ReviewLikeFacade {
	
	void insertLike(ReviewLike reviewLike); //좋아요 추가
	
	void deleteLike(ReviewLike reviewLike); //좋아요 삭제
	
	int countLike(int boardNum);
	
	int isLike(ReviewLike reviewLike);
}
