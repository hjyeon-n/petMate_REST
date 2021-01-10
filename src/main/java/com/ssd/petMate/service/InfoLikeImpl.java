package com.ssd.petMate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.InfoLikeDao;
import com.ssd.petMate.domain.InfoLike;

@Service
@Transactional
public class InfoLikeImpl implements InfoLikeFacade{

	@Autowired
	private InfoLikeDao infoLikeDao;
	
	@Override
	public void insertLike(InfoLike infoLike) {
		// TODO Auto-generated method stub
		infoLikeDao.insertLike(infoLike);
	}

	@Override
	public void deleteLike(InfoLike infoLike) {
		// TODO Auto-generated method stub
		infoLikeDao.deleteLike(infoLike);
	}

	@Override
	public int countLike(int boardNum) {
		// TODO Auto-generated method stub
		return infoLikeDao.countLike(boardNum);
	}

	@Override
	public int isLike(InfoLike infoLike) {
		// TODO Auto-generated method stub
		return infoLikeDao.isLike(infoLike);
	}
}
