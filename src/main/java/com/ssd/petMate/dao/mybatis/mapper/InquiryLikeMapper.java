package com.ssd.petMate.dao.mybatis.mapper;

import com.ssd.petMate.domain.InquiryLike;

public interface InquiryLikeMapper {
	public void insertLike(InquiryLike inquiryLike); //좋아요 추가
	
	public void deleteLike(InquiryLike inquiryLike); //좋아요 삭제
	
	public int countLike(int boardNum); //추천 수
	
	public int isLike(InquiryLike infoLike);
}
