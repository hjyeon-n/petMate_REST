package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.page.pageMaker;

public interface SecondhandCartMapper {
	
	int getSecondhandCartCount(int userId); //사용자가 담은 장바구니 수 가져오기
	
	void insertSecondhandCart(SecondhandCart secondhandCart); //장바구니 추가
	
	void deleteSecondhandCart(SecondhandCart secondhandCart); //장바구니 삭제
	
	List<SecondhandCartCommand> getSecondhandCartListBySecondhand(String userID); //cart+gpuchase
	
	int countCartByboardNum(int boardNum); // 게시글에 대한 담은 장바구니 총 개수
	
	int isCart(SecondhandCart secondhandCart); //이 게시글을 사용자가 담았는지 확인

}
