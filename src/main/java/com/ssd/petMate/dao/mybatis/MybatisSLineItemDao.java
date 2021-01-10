package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GLineItemDao;
import com.ssd.petMate.dao.GpurchaseCartDao;
import com.ssd.petMate.dao.GpurchaseDao;
import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.dao.OrderDao;
import com.ssd.petMate.dao.SLineItemDao;
import com.ssd.petMate.dao.SecondhandDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseCartMapper;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseLineItemMapper;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseMapper;
import com.ssd.petMate.dao.mybatis.mapper.InfoMapper;
import com.ssd.petMate.dao.mybatis.mapper.OrderMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandLineItemMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandMapper;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.domain.GpurchaseLineItem;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Order;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandLineItem;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisSLineItemDao implements SLineItemDao {

	@Autowired
	private SecondhandLineItemMapper sLineItemMapper;

	@Override
	public List<SecondhandLineItem> getSecondhandLineItemList(int orderNum) throws DataAccessException {
		return sLineItemMapper.getSecondhandLineItemList(orderNum);
	}

	@Override
	public void insertSecondhandLineItem(SecondhandLineItem secondhandLineItem) throws DataAccessException {
		sLineItemMapper.insertSecondhandLineItem(secondhandLineItem);
	}
	
}