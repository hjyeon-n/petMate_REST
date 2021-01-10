package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandLineItem;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.page.pageMaker;

public interface SecondhandLineItemMapper {
	
	List<SecondhandLineItem> getSecondhandLineItemList(int orderNum); //중고물품 order에 대한 lineitemList 가져오기
	
	void insertSecondhandLineItem(SecondhandLineItem secondhandLineItem); //중고물품 order에 대한 lineitem 추가
	

}
