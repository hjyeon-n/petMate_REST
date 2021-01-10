package com.ssd.petMate.dao.mybatis.mapper;

import com.ssd.petMate.domain.PetsitterLike;

public interface PetsitterLikeMapper {
	public void insertLike(PetsitterLike petsitterLike); //좋아요 추가
	
	public void deleteLike(PetsitterLike petsitterLike); //좋아요 삭제
	
	public int countLike(int boardNum); //추천 수
	
	public int isLike(PetsitterLike petsitterLike);
}
