package com.ssd.petMate.dao;

import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;

public interface GpurchaseCartDao {

//	public List<GpurchaseCart> getGpurchaseCartList(BoardSearch boardSearch) throws DataAccessException; //장바구니 목록
//	
	public int getGpurchaseCartCount(int userId) throws DataAccessException; //장바구니 수 가져오기
	
	public void insertGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException; //장바구니 추가
	
	public void deleteGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException; //장바구니 삭제
	
	public List<GpurchaseCartCommand> getGpurchaseCartListByGpurchase(String userID) throws DataAccessException; //cart+gpuchase
	
	public int countCartByboardNum(int boardNum) throws DataAccessException; // 게시글에 대한 담은 장바구니 총 개수
	
	public int isCart(GpurchaseCart gpurchaseCart) throws DataAccessException; //이 게시글을 사용자가 담았는지 확인
	
	public void deleteFinished() throws DataAccessException;
}
