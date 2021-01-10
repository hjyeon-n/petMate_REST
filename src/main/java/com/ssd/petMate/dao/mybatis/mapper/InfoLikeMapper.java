package com.ssd.petMate.dao.mybatis.mapper;

import com.ssd.petMate.domain.InfoLike;

public interface InfoLikeMapper {
	public void insertLike(InfoLike infoLike); //좋아요 추가
	
	public void deleteLike(InfoLike infoLike); //좋아요 삭제
	
	public int countLike(int boardNum); //추천 수
	
	public int isLike(InfoLike infoLike);
}
