package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GpurchaseCartDao;
import com.ssd.petMate.dao.GpurchaseDao;
import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.dao.SecondhandCartDao;
import com.ssd.petMate.dao.SecondhandDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseCartMapper;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseMapper;
import com.ssd.petMate.dao.mybatis.mapper.InfoMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandCartMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandMapper;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisSecondhandCartDao implements SecondhandCartDao {

	@Autowired
	private SecondhandCartMapper secondhandCartMapper;
	
	public int getSecondhandCartCount(int userId) throws DataAccessException {//장바구니 수 가져오기
		return secondhandCartMapper.getSecondhandCartCount(userId);
	}
	
	public void insertSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException{ //장바구니 추가
		secondhandCartMapper.insertSecondhandCart(secondhandCart);
	}
	
	public void deleteSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException{ //장바구니 삭제
		secondhandCartMapper.deleteSecondhandCart(secondhandCart);
	}
	public List<SecondhandCartCommand> getSecondhandCartListBySecondhand(String userID) throws DataAccessException{ //cart+gpuchase
		return secondhandCartMapper.getSecondhandCartListBySecondhand(userID);
	}
	public int countCartByboardNum(int boardNum) { // 게시글에 대한 담은 장바구니 총 개수
		return secondhandCartMapper.countCartByboardNum(boardNum);
	}
	
	public int isCart(SecondhandCart secondhandCart) { //이 게시글을 사용자가 담았는지 확인
		return secondhandCartMapper.isCart(secondhandCart);
	}
}