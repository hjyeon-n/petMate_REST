package com.ssd.petMate.dao.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GLineItemDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseLineItemMapper;
import com.ssd.petMate.domain.GpurchaseLineItem;

@Repository
public class MybatisGLineItemDao implements GLineItemDao {

	@Autowired
	private GpurchaseLineItemMapper gLineItemMapper;
	
	public List<GpurchaseLineItem> getGpurchaseLineItemList(int orderNum) throws DataAccessException{
		return gLineItemMapper.getGpurchaseLineItemList(orderNum);
	}
	
	public void insertGpurchaseLineItem(GpurchaseLineItem gpurchaseLineItem) throws DataAccessException{
		gLineItemMapper.insertGpurchaseLineItem(gpurchaseLineItem);
	}
}