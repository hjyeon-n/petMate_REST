package com.ssd.petMate.dao.mybatis.mapper;

import com.ssd.petMate.domain.ReviewLike;

public interface ReviewLikeMapper {
public void insertLike(ReviewLike reviewLike); //좋아요 추가
	
	public void deleteLike(ReviewLike reviewLike); //좋아요 삭제
	
	public int countLike(int boardNum); //추천 수
	
	public int isLike(ReviewLike reviewLike);
}
