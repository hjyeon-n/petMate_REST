package com.ssd.petMate.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.SecondhandLineItem;

public interface SLineItemFacade {

	public List<SecondhandLineItem> getSecondhandLineItemList(int orderNum) throws DataAccessException; //orderNum에 대한 
	
	public void insertSecondhandLineItem(SecondhandLineItem secondhandLineItem) throws DataAccessException; //공동구매 order에 대한 lineitem 추가
	
}