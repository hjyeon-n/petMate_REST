package com.ssd.petMate.dao.mybatis.mapper;

import java.util.List;

import com.ssd.petMate.domain.Order;

public interface OrderMapper {
  
  void insertOrder(Order order); //주문 추가하기
  
}
