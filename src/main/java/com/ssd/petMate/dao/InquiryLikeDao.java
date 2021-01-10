package com.ssd.petMate.dao;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.InquiryLike;

public interface InquiryLikeDao {

	public void insertLike(InquiryLike inquiryLike) throws DataAccessException; //좋아요 추가
	
	public void deleteLike(InquiryLike inquiryLike) throws DataAccessException; //좋아요 삭제
	
	public int countLike(int boardNum) throws DataAccessException; //추천 수
	
	public int isLike(InquiryLike inquiryLike) throws DataAccessException;
}
