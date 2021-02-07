package com.ssd.petMate.dao.mybatis;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.SecondhandCartDao;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandCartMapper;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;

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