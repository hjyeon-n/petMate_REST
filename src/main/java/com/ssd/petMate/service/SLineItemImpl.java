package com.ssd.petMate.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.SLineItemDao;
import com.ssd.petMate.domain.SecondhandLineItem;

@Service
@Transactional
public class SLineItemImpl implements SLineItemFacade { 
	
	@Autowired
	private SLineItemDao sLineItemDao;

	@Override
	public List<SecondhandLineItem> getSecondhandLineItemList(int orderNum) throws DataAccessException {
		return sLineItemDao.getSecondhandLineItemList(orderNum);
	}

	@Override
	public void insertSecondhandLineItem(SecondhandLineItem secondhandLineItem) throws DataAccessException {
		sLineItemDao.insertSecondhandLineItem(secondhandLineItem);
	}
	
}