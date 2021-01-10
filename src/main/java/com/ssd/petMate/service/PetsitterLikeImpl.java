package com.ssd.petMate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.PetsitterLikeDao;
import com.ssd.petMate.domain.PetsitterLike;

@Service
@Transactional
public class PetsitterLikeImpl implements PetsitterLikeFacade{

	@Autowired
	private PetsitterLikeDao petsitterLikeDao;
	
	@Override
	public void insertLike(PetsitterLike petsitterLike) {
		petsitterLikeDao.insertLike(petsitterLike);
	}

	@Override
	public void deleteLike(PetsitterLike petsitterLike) {
		petsitterLikeDao.deleteLike(petsitterLike);
	}

	@Override
	public int countLike(int boardNum) {
		return petsitterLikeDao.countLike(boardNum);
	}

	@Override
	public int isLike(PetsitterLike petsitterLike) {
		return petsitterLikeDao.isLike(petsitterLike);
	}
}
