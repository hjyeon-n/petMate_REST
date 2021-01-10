package com.ssd.petMate.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.OrderDao;

import com.ssd.petMate.domain.Order;

@Service
@Transactional
public class OrderImpl implements OrderFacade { 
	
	@Autowired
	private OrderDao orderDao;
	
	public void insertOrder(Order order) throws DataAccessException{ // 주문 생성
		orderDao.insertOrder(order);
	}
	
}