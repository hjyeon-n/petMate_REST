package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.dao.GpurchaseCartDao;
import com.ssd.petMate.dao.GpurchaseDao;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class GpurchaseImpl implements GpurchaseFacade { 
	
	@Autowired
	private GpurchaseDao gpurchaseDao;
	
	@Autowired
	private GpurchaseCartDao gpurchaseCartDao;
	 
	
	public List<Gpurchase> getGpurchaseList(BoardSearch boardSearch) throws DataAccessException{
		return gpurchaseDao.getGpurchaseList(boardSearch);
	}
	
	public int getGpurchaseBoardCount(HashMap<String, Object> map) throws DataAccessException {
		return gpurchaseDao.getGpurchaseBoardCount(map);
	}
		
	public void insertGpurchase(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseDao.insertGpurchase(gpurchase);
	}
		
	public Gpurchase getGpurchaseDetail(int boardNum) throws DataAccessException{
		return gpurchaseDao.getGpurchaseDetail(boardNum);
	}
		
	public void updateGpurchase(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseDao.updateGpurchase(gpurchase);
	}
		
	public void deleteGpurchase(int boardNum) throws DataAccessException{
		gpurchaseDao.deleteGpurchase(boardNum);
	}
	
	public void gpurchaseBoardHitPlus(int boardNum) throws DataAccessException{
		gpurchaseDao.gpurchaseBoardHitPlus(boardNum);
	} // 조회수 증가
	
	public void gpurchaseCartUpdate(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseDao.gpurchaseCartUpdate(gpurchase);
	} //장바구니 담은 수 업데이트
	
	@Override
	public void gpurchaseReplyCntUpdate(Gpurchase gpurchase) throws DataAccessException {
		gpurchaseDao.gpurchaseReplyCntUpdate(gpurchase);	
	} // 댓글 수 업데이트
	
	//공동구매 참여자 수 증가
	public void updateParticipant(int boardNum) throws DataAccessException{
		gpurchaseDao.updateParticipant(boardNum);
	}
	
	public List<GpurchaseCartCommand> getGpurchaseCartListByGpurchase(String userID) throws DataAccessException{
		return gpurchaseCartDao.getGpurchaseCartListByGpurchase(userID);
	} //cart+gpuchase
	
	public void insertGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException{ //장바구니 추가
		gpurchaseCartDao.insertGpurchaseCart(gpurchaseCart);
	}
	
	public void deleteGpurchaseCart(GpurchaseCart gpurchaseCart) throws DataAccessException{  //장바구니 삭제
		gpurchaseCartDao.deleteGpurchaseCart(gpurchaseCart);
	}
	
	public int countCartByboardNum(int boardNum) { // 게시글에 대한 담은 장바구니 총 개수
		return gpurchaseCartDao.countCartByboardNum(boardNum);
	}
	
	public int isCart(GpurchaseCart gpurchaseCart) { //이 게시글을 사용자가 담았는지 확인
		return gpurchaseCartDao.isCart(gpurchaseCart);
	}

	@Override
	public void updateResult(Gpurchase gpurchase) {
		// TODO Auto-generated method stub
		gpurchaseDao.updateResult(gpurchase);
	}

	@Override
	public void deleteFinished() {
		// TODO Auto-generated method stub
		gpurchaseCartDao.deleteFinished();
	}
}