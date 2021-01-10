package com.ssd.petMate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.ReviewLikeDao;
import com.ssd.petMate.domain.ReviewLike;

@Service
@Transactional
public class ReviewLikeImpl implements ReviewLikeFacade{

	@Autowired
	private ReviewLikeDao reviewLikeDao;
	
	@Override
	public void insertLike(ReviewLike reviewLike) {
		// TODO Auto-generated method stub
		reviewLikeDao.insertLike(reviewLike);
	}

	@Override
	public void deleteLike(ReviewLike reviewLike) {
		// TODO Auto-generated method stub
		reviewLikeDao.deleteLike(reviewLike);
	}

	@Override
	public int countLike(int boardNum) {
		// TODO Auto-generated method stub
		return reviewLikeDao.countLike(boardNum);
	}

	@Override
	public int isLike(ReviewLike reviewLike) {
		// TODO Auto-generated method stub
		return reviewLikeDao.isLike(reviewLike);
	}
}
