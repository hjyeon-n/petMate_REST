package com.ssd.petMate.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.OrderDao;
import com.ssd.petMate.dao.mybatis.mapper.OrderMapper;
import com.ssd.petMate.domain.Order;

@Repository
public class MybatisOrderDao implements OrderDao {

	@Autowired
	private OrderMapper orderMapper;
	
	public void insertOrder(Order order) throws DataAccessException{
		orderMapper.insertOrder(order);
	}
	
}