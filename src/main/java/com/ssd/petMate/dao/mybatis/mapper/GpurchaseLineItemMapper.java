package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.GpurchaseLineItem;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.page.pageMaker;

public interface GpurchaseLineItemMapper {
	
	public List<GpurchaseLineItem> getGpurchaseLineItemList(int orderNum); //공동구매 order에 대한 lineitemList 가져오기
	
	public void insertGpurchaseLineItem(GpurchaseLineItem gpurchaseLineItem); //공동구매 order에 대한 lineitem 추가
	

}
