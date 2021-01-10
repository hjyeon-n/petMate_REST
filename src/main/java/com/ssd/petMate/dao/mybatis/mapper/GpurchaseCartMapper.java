package com.ssd.petMate.dao.mybatis.mapper;

import java.util.List;

import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;

public interface GpurchaseCartMapper {
	
//	public List<GpurchaseCart> getGpurchaseCartList(BoardSearch boardSearch); //장바구니 목록
	
	public int getGpurchaseCartCount(int userId); //사용자가 담은 장바구니 수 가져오기
	
	public void insertGpurchaseCart(GpurchaseCart gpurchaseCart); //장바구니 추가
	
	public void deleteGpurchaseCart(GpurchaseCart gpurchaseCart); //장바구니 삭제
	
	public List<GpurchaseCartCommand> getGpurchaseCartListByGpurchase(String userID); //cart+gpuchase
	
	public int countCartByboardNum(int boardNum); // 게시글에 대한 담은 장바구니 총 개수
	
	public int isCart(GpurchaseCart gpurchaseCart); //이 게시글을 사용자가 담았는지 확인
	
	public void deleteFinished();

}
