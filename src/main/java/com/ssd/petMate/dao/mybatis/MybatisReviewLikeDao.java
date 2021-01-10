package com.ssd.petMate.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.ReviewLikeDao;
import com.ssd.petMate.dao.mybatis.mapper.ReviewLikeMapper;
import com.ssd.petMate.domain.ReviewLike;

@Repository
public class MybatisReviewLikeDao implements ReviewLikeDao{
	
	@Autowired
	private ReviewLikeMapper reviewLikeMapper;
	
	public void insertLike(ReviewLike reviewLike) throws DataAccessException {
		reviewLikeMapper.insertLike(reviewLike);
	}
	
	public void deleteLike(ReviewLike reviewLike) throws DataAccessException {
		reviewLikeMapper.deleteLike(reviewLike);
	}
	
	public int countLike(int boardNum) throws DataAccessException {
		return reviewLikeMapper.countLike(boardNum);
	}

	public int isLike(ReviewLike reviewLike) throws DataAccessException {
		return reviewLikeMapper.isLike(reviewLike);
	}
}
