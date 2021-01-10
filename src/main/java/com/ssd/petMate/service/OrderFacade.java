package com.ssd.petMate.service;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Order;


public interface OrderFacade {

	public void insertOrder(Order order) throws DataAccessException; //게시글 작성
	
}