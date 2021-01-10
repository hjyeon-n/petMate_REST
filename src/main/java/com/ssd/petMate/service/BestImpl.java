package com.ssd.petMate.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.BestDao;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Review;

@Service
@Transactional
public class BestImpl implements BestFacade{

	@Autowired
	private BestDao bestDao;

	@Override
	public List<Info> weeklyBestInfo(Date date) {
		// TODO Auto-generated method stub
		return bestDao.weeklyBestInfo(date);
	}

	@Override
	public Info dailyBestInfo() {
		// TODO Auto-generated method stub
		return bestDao.dailyBestInfo();
	}

	@Override
	public List<Inquiry> weeklyBestInquiry(Date date) {
		// TODO Auto-generated method stub
		return bestDao.weeklyBestInquiry(date);
	}

	@Override
	public Inquiry dailyBestInquiry() {
		// TODO Auto-generated method stub
		return bestDao.dailyBestInquiry();
	}

	@Override
	public List<Review> weeklyBestReview(Date date) {
		// TODO Auto-generated method stub
		return bestDao.weeklyBestReview(date);
	}

	@Override
	public Review dailyBestReview() {
		// TODO Auto-generated method stub
		return bestDao.dailyBestReview();
	}

	@Override
	public List<Gpurchase> weeklyBestGpurchase(Date date) {
		// TODO Auto-generated method stub
		return bestDao.weeklyBestGpurchase(date);
	}

	@Override
	public Gpurchase dailyBestGpurchase() {
		// TODO Auto-generated method stub
		return bestDao.dailyBestGpurchase();
	}
}
