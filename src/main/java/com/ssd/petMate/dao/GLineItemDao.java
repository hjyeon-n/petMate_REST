package com.ssd.petMate.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.GpurchaseLineItem;

public interface GLineItemDao {
	
	public List<GpurchaseLineItem> getGpurchaseLineItemList(int orderNum) throws DataAccessException; //orderNum에 대한 
	
	public void insertGpurchaseLineItem(GpurchaseLineItem gpurchaseLineItem) throws DataAccessException; //공동구매 order에 대한 lineitem 추가
	
}
