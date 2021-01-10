package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.SecondhandCartDao;
import com.ssd.petMate.dao.SecondhandDao;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class SecondhandImpl implements SecondhandFacade { 
	
	@Autowired
	private SecondhandDao secondhandDao;
	
	@Autowired
	private SecondhandCartDao secondhandCartDao;
	
	//게시글 목록
	public List<Secondhand> getSecondhandList(BoardSearch boardSearch) throws DataAccessException {
		return secondhandDao.getSecondhandList(boardSearch);
	}
	
	//게시글 수 가져오기
	public int getSecondhandBoardCount(HashMap<String, Object> map) throws DataAccessException {
		return secondhandDao.getSecondhandBoardCount(map);
	}
	
	//게시글 작성
	public void insertSecondhand(Secondhand secondhand) throws DataAccessException{
		secondhandDao.insertSecondhand(secondhand);
	}
	
	//게시글 상세보기
	public Secondhand getSecondhandDetail(int boardNum) throws DataAccessException{
		return secondhandDao.getSecondhandDetail(boardNum);
	}
	
	//게시글 수정
	public void updateSecondhand(Secondhand secondhand) throws DataAccessException{
		secondhandDao.updateSecondhand(secondhand);
	}
	
	//게시글 삭제
	public void deleteSecondhand(int boardNum) throws DataAccessException{
		secondhandDao.deleteSecondhand(boardNum);
	}
	
	//조회 수 증가
	public void secondhandBoardHitPlus(int boardNum) throws DataAccessException{
		secondhandDao.secondhandBoardHitPlus(boardNum);
	}
	
	public void secondhandCartUpdate(Secondhand secondhand) throws DataAccessException{
		secondhandDao.secondhandCartUpdate(secondhand);
	} //장바구니 담은 수 증가
	
	public void secondhandReplyCntUpdate(Secondhand secondhand) throws DataAccessException{
		secondhandDao.secondhandReplyCntUpdate(secondhand);
	} //덧글수 증가
	
	public void secondhandIsSold(Secondhand secondhand)throws DataAccessException{ // 판매완료
		secondhandDao.secondhandIsSold(secondhand);
	}
	
	public void insertSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException{ //장바구니 추가
		secondhandCartDao.insertSecondhandCart(secondhandCart);
	}
	
	public void deleteSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException{ //장바구니 삭제
		secondhandCartDao.deleteSecondhandCart(secondhandCart);
	}
	public List<SecondhandCartCommand> getSecondhandCartListBySecondhand(String userID) throws DataAccessException{ //cart+gpuchase
		return secondhandCartDao.getSecondhandCartListBySecondhand(userID);
	}
	public int countCartByboardNum(int boardNum) { // 게시글에 대한 담은 장바구니 총 개수
		return secondhandCartDao.countCartByboardNum(boardNum);
	}
	
	public int isCart(SecondhandCart secondhandCart) { //이 게시글을 사용자가 담았는지 확인
		return secondhandCartDao.isCart(secondhandCart);
	}	
	
	
}