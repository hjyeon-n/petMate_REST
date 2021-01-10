package com.ssd.petMate.dao;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Order;

public interface OrderDao {

  void insertOrder(Order order) throws DataAccessException;

}
