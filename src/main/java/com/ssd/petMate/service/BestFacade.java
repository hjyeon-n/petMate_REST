package com.ssd.petMate.service;

import java.util.Date;
import java.util.List;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Review;

public interface BestFacade {
	List<Info> weeklyBestInfo(Date date); 
	List<Inquiry> weeklyBestInquiry(Date date);
	List<Review> weeklyBestReview(Date date);
	List<Gpurchase> weeklyBestGpurchase(Date date);
	Info dailyBestInfo(); 
	Inquiry dailyBestInquiry();
	Review dailyBestReview();
	Gpurchase dailyBestGpurchase();
}
