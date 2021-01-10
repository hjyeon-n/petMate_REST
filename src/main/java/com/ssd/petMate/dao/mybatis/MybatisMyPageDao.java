package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.MyPageDao;
import com.ssd.petMate.dao.mybatis.mapper.MyPageMapper;
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

@Repository
public class MybatisMyPageDao implements MyPageDao{
	
	@Autowired
	private MyPageMapper myPageMapper;

	@Override
	public int getPrivateInfoCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInfoCount(map);
	}

	@Override
	public List<Info> getPrivateInfoList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInfoList(boardSearch);
	}
	
	@Override
	public int getPrivateReviewReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateReviewReplyCount(map);
	}

	@Override
	public List<Review> getPrivateReviewReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateReviewReplyList(boardSearch);
	}

	@Override
	public int getPrivateInquiryReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInquiryReplyCount(map);
	}

	@Override
	public List<Inquiry> getPrivateInquiryReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInquiryReplyList(boardSearch);
	}

	@Override
	public int getPrivateInfoReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInfoReplyCount(map);
	}

	@Override
	public List<Info> getPrivateInfoReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInfoReplyList(boardSearch);
	}

	@Override
	public int getPrivateGpurchaseReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateGpurchaseReplyCount(map);
	}

	@Override
	public List<Gpurchase> getPrivateGpurchaseReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateGpurchaseReplyList(boardSearch);
	}

	@Override
	public int getPrivateSecondhandReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateSecondhandReplyCount(map);
	}

	@Override
	public List<Secondhand> getPrivateSecondhandReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateSecondhandReplyList(boardSearch);
	}

	@Override
	public int getPrivatePetsitterReplyCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivatePetsitterReplyCount(map);
	}

	@Override
	public List<Petsitter> getPrivatePetsitterReplyList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivatePetsitterReplyList(boardSearch);
	}

	@Override
	public int getPrivateInquiryCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInquiryCount(map);
	}

	@Override
	public List<Inquiry> getPrivateInquiryList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateInquiryList(boardSearch);
	}

	@Override
	public int getPrivateSecondhandCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateSecondhandCount(map);
	}

	@Override
	public List<Secondhand> getPrivateSecondhandList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateSecondhandList(boardSearch);
	}

	@Override
	public int getPrivateGpurchaseCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateGpurchaseCount(map);
	}

	@Override
	public List<Gpurchase> getPrivateGpurchaseList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateGpurchaseList(boardSearch);
	}

	@Override
	public int getPrivatePetsitterCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivatePetsitterCount(map);
	}

	@Override
	public List<Petsitter> getPrivatePetsitterList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivatePetsitterList(boardSearch);
	}

	@Override
	public int getPrivateReviewCount(HashMap<String, Object> map) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateReviewCount(map);
	}

	@Override
	public List<Review> getPrivateReviewList(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return myPageMapper.getPrivateReviewList(boardSearch);
	}
	
	public int getPrivateInfoLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageMapper.getPrivateInfoLikeCount(map);
	}
	
	public List<Info> getPrivateInfoLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageMapper.getPrivateInfoLike(boardSearch);
	}
	
	public int getPrivateInquiryLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageMapper.getPrivateInquiryLikeCount(map);
	}
	
	public List<Inquiry> getPrivateInquiryLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageMapper.getPrivateInquiryLike(boardSearch);
	}
	
	public int getPrivatePetsitterLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageMapper.getPrivatePetsitterLikeCount(map);
	}
	
	public List<Petsitter> getPrivatePetsitterLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageMapper.getPrivatePetsitterLike(boardSearch);
	}
	
	public int getPrivateReviewLikeCount(HashMap<String, Object> map) throws DataAccessException{
		return myPageMapper.getPrivateReviewLikeCount(map);
	}
	
	public List<Review> getPrivateReviewLike(BoardSearch boardSearch) throws DataAccessException{
		return myPageMapper.getPrivateReviewLike(boardSearch);
	}
	
	public int getPrivateOrderListCount(String userID) throws DataAccessException{
		return myPageMapper.getPrivateOrderListCount(userID);
	}
	
	public List<Order> getPrivateOrderList(BoardSearch boardSearch) throws DataAccessException{
		return myPageMapper.getPrivateOrderList(boardSearch);
	}
	
	public OrderCommand getOrderLineItems(int orderNum) throws DataAccessException{
		return myPageMapper.getOrderLineItems(orderNum);
	}
	
	public SOrderCommand getOrderSLineItems(int orderNum) throws DataAccessException{
		return myPageMapper.getOrderSLineItems(orderNum);
	}

}