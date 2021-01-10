package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.dao.DataAccessException;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;

public interface SecondhandFacade {
	
	public List<Secondhand> getSecondhandList(BoardSearch boardSearch) throws DataAccessException; //게시글 목록
	
	public int getSecondhandBoardCount(HashMap<String, Object> map) throws DataAccessException;//게시글 수 가져오기
	
	public void insertSecondhand(Secondhand secondhand) throws DataAccessException;	 //게시글 작성

	public Secondhand getSecondhandDetail(int boardNum) throws DataAccessException;//게시글 상세보기
	
	public void updateSecondhand(Secondhand secondhand) throws DataAccessException;//게시글 수정

	public void deleteSecondhand(int boardNum) throws DataAccessException;	//게시글 삭제
	
	public void secondhandBoardHitPlus(int boardNum) throws DataAccessException; //조회 수 증가
	
	public void secondhandCartUpdate(Secondhand secondhand) throws DataAccessException;
	
	public void secondhandReplyCntUpdate(Secondhand secondhand) throws DataAccessException;
	
	public void insertSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException; //장바구니 추가
	
	public void deleteSecondhandCart(SecondhandCart secondhandCart) throws DataAccessException; //장바구니 삭제
	
	public List<SecondhandCartCommand> getSecondhandCartListBySecondhand(String userID) throws DataAccessException; //cart+gpuchase
	
	public int countCartByboardNum(int boardNum)throws DataAccessException; // 게시글에 대한 담은 장바구니 총 개수
	
	public int isCart(SecondhandCart secondhandCart)throws DataAccessException; //이 게시글을 사용자가 담았는지 확인
	
	public void secondhandIsSold(Secondhand secondhand)throws DataAccessException; // 판매완료

}