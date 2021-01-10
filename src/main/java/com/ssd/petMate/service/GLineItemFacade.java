package com.ssd.petMate.service;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.GpurchaseLineItem;

public interface GLineItemFacade {

	public List<GpurchaseLineItem> getGpurchaseLineItemList(int orderNum) throws DataAccessException; //orderNum에 대한 lineitem List
	
	public void insertGpurchaseLineItem(GpurchaseLineItem gpurchaseLineItem) throws DataAccessException; // lineItem 생성
	
}