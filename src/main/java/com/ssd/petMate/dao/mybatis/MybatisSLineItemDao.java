package com.ssd.petMate.dao.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.SLineItemDao;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandLineItemMapper;
import com.ssd.petMate.domain.SecondhandLineItem;

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