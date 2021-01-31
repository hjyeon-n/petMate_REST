package com.ssd.petMate.dao.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GpurchaseCartDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseCartMapper;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;

@Repository
public class MybatisGpurchaseCartDao implements GpurchaseCartDao {

	@Autowired
	private GpurchaseCartMapper gpurchaseCartMapper;
	
	public int getGpurchaseCartCount(int userId) throws DataAccessException{
		return gpurchaseCartMapper.getGpurchaseCartCount(userId);
	} //장바구니 수 가져오기
	
	public void insertGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException{
		gpurchaseCartMapper.insertGpurchaseCart(gpurchaseCart);
	} //장바구니 추가
	
	public void deleteGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException{
		gpurchaseCartMapper.deleteGpurchaseCart(gpurchaseCart);
	}//장바구니 삭제
	
	public List<GpurchaseCartCommand> getGpurchaseCartListByGpurchase(String userID) throws DataAccessException{
		return gpurchaseCartMapper.getGpurchaseCartListByGpurchase(userID);
	} //cart+gpuchase
	
	public int countCartByboardNum(int boardNum) throws DataAccessException { // 게시글에 대한 담은 장바구니 총 개수
		return gpurchaseCartMapper.countCartByboardNum(boardNum);
	}
	
	public int isCart(GpurchaseCart gpurchaseCart) throws DataAccessException {//이 게시글을 사용자가 담았는지 확인
		return gpurchaseCartMapper.isCart(gpurchaseCart);
	}

	@Override
	public void deleteFinished() throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseCartMapper.deleteFinished();
	}	
}