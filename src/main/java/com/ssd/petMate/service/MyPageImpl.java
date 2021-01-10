package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.MyPageDao;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Order;
import com.ssd.petMate.domain.OrderCommand;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.domain.Review;
import com.ssd.petMate.domain.SOrderCommand;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class MyPageImpl implements MyPageFacade {
	@Autowired
	private MyPageDao myPageDao;

	@Override
	public int getPrivateInfoCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInfoCount(map);
	}

	@Override
	public List<Info> getPrivateInfoList(BoardSearch boardSearch) {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInfoList(boardSearch);
	}
	
	@Override
	public int getPrivateReviewReplyCount(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateReviewReplyCount(map);
	}

	@Override
	public List<Review> getPrivateReviewReplyList(BoardSearch boardSearch) {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateReviewReplyList(boardSearch);
	}

	@Override
	public int getPrivateInquiryReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInquiryReplyCount(map);
	}

	@Override
	public List<Inquiry> getPrivateInquiryReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInquiryReplyList(boardSearch);
	}

	@Override
	public int getPrivateInfoReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInfoReplyCount(map);
	}

	@Override
	public List<Info> getPrivateInfoReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInfoReplyList(boardSearch);
	}

	@Override
	public int getPrivateGpurchaseReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateGpurchaseReplyCount(map);
	}

	@Override
	public List<Gpurchase> getPrivateGpurchaseReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateGpurchaseReplyList(boardSearch);
	}

	@Override
	public int getPrivateSecondhandReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateSecondhandReplyCount(map);
	}

	@Override
	public List<Secondhand> getPrivateSecondhandReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateSecondhandReplyList(boardSearch);
	}

	@Override
	public int getPrivatePetsitterReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivatePetsitterReplyCount(map);
	}

	@Override
	public List<Petsitter> getPrivatePetsitterReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivatePetsitterReplyList(boardSearch);
	}

	@Override
	public int getPrivateInquiryCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInquiryCount(map);
	}

	@Override
	public List<Inquiry> getPrivateInquiryList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateInquiryList(boardSearch);
	}

	@Override
	public int getPrivateSecondhandCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateSecondhandCount(map);
	}

	@Override
	public List<Secondhand> getPrivateSecondhandList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateSecondhandList(boardSearch);
	}

	@Override
	public int getPrivateGpurchaseCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateGpurchaseCount(map);
	}

	@Override
	public List<Gpurchase> getPrivateGpurchaseList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateGpurchaseList(boardSearch);
	}

	@Override
	public int getPrivatePetsitterCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivatePetsitterCount(map);
	}

	@Override
	public List<Petsitter> getPrivatePetsitterList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivatePetsitterList(boardSearch);
	}

	@Override
	public int getPrivateReviewCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateReviewCount(map);
	}

	@Override
	public List<Review> getPrivateReviewList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageDao.getPrivateReviewList(boardSearch);
	}
	
	public int getPrivateInfoLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageDao.getPrivateInfoLikeCount(map);
	}
	
	public List<Info> getPrivateInfoLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageDao.getPrivateInfoLike(boardSearch);
	}
	
	public int getPrivateInquiryLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageDao.getPrivateInquiryLikeCount(map);
	}
	
	public List<Inquiry> getPrivateInquiryLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageDao.getPrivateInquiryLike(boardSearch);
	}
	
	public int getPrivatePetsitterLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageDao.getPrivatePetsitterLikeCount(map);
	}
	
	public List<Petsitter> getPrivatePetsitterLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageDao.getPrivatePetsitterLike(boardSearch);
	}
	
	public int getPrivateReviewLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageDao.getPrivateReviewLikeCount(map);
	}
	
	public List<Review> getPrivateReviewLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageDao.getPrivateReviewLike(boardSearch);
	}
	
	public int getPrivateOrderListCount(String userID) throws DataAccessException{
		return myPageDao.getPrivateOrderListCount(userID);
	}
	
	public List<Order> getPrivateOrderList(BoardSearch boardSearch) throws DataAccessException{
		return myPageDao.getPrivateOrderList(boardSearch);
	}
	
	public OrderCommand getOrderLineItems(int orderNum) throws DataAccessException{
		return myPageDao.getOrderLineItems(orderNum);
	}
	
	public SOrderCommand getOrderSLineItems(int orderNum) throws DataAccessException{
		return myPageDao.getOrderSLineItems(orderNum);
	}

}
