package com.ssd.petMate.dao;

import java.util.Date;
import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Review;

public interface BestDao {
	List<Info> weeklyBestInfo(Date date) throws DataAccessException;
	List<Inquiry> weeklyBestInquiry(Date date) throws DataAccessException;
	List<Review> weeklyBestReview(Date date) throws DataAccessException;
	List<Gpurchase> weeklyBestGpurchase(Date date) throws DataAccessException;
	Info dailyBestInfo() throws DataAccessException;
	Inquiry dailyBestInquiry() throws DataAccessException;
	Review dailyBestReview() throws DataAccessException;
	Gpurchase dailyBestGpurchase() throws DataAccessException;
}
