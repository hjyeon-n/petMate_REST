package com.ssd.petMate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.InquiryLikeDao;
import com.ssd.petMate.domain.InquiryLike;

@Service
@Transactional
public class InquiryLikeImpl implements InquiryLikeFacade{

	@Autowired
	private InquiryLikeDao inquiryLikeDao;
	
	@Override
	public void insertLike(InquiryLike inquiryLike) {
		// TODO Auto-generated method stub
		inquiryLikeDao.insertLike(inquiryLike);
	}

	@Override
	public void deleteLike(InquiryLike inquiryLike) {
		// TODO Auto-generated method stub
		inquiryLikeDao.deleteLike(inquiryLike);
	}

	@Override
	public int countLike(int boardNum) {
		// TODO Auto-generated method stub
		return inquiryLikeDao.countLike(boardNum);
	}

	@Override
	public int isLike(InquiryLike inquiryLike) {
		// TODO Auto-generated method stub
		return inquiryLikeDao.isLike(inquiryLike);
	}
}
