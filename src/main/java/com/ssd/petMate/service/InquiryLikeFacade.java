package com.ssd.petMate.service;

import com.ssd.petMate.domain.InquiryLike;

public interface InquiryLikeFacade {
	
	void insertLike(InquiryLike inquiryLike); //좋아요 추가
	
	void deleteLike(InquiryLike inquiryLike); //좋아요 삭제
	
	int countLike(int boardNum);
	
	int isLike(InquiryLike inquiryLike);
}
