package com.ssd.petMate.dao.mybatis;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.BestDao;
import com.ssd.petMate.dao.mybatis.mapper.BestMapper;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Review;

@Repository
public class MybatisBestDao implements BestDao{
	@Autowired
	private BestMapper bestMapper;

	@Override
	public List<Info> weeklyBestInfo(Date date) throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.weeklyBestInfo(date);
	}

	@Override
	public Info dailyBestInfo() throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.dailyBestInfo();
	}

	@Override
	public List<Inquiry> weeklyBestInquiry(Date date) throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.weeklyBestInquiry(date);
	}

	@Override
	public Inquiry dailyBestInquiry() throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.dailyBestInquiry();
	}

	@Override
	public List<Review> weeklyBestReview(Date date) throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.weeklyBestReview(date);
	}

	@Override
	public Review dailyBestReview() throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.dailyBestReview();
	}

	@Override
	public List<Gpurchase> weeklyBestGpurchase(Date date) throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.weeklyBestGpurchase(date);
	}

	@Override
	public Gpurchase dailyBestGpurchase() throws DataAccessException {
		// TODO Auto-generated method stub
		return bestMapper.dailyBestGpurchase();
	}
}
