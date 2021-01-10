package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;

public interface SecondhandDao {
	//게시글 목록
	public List<Secondhand> getSecondhandList(BoardSearch boardSearch) throws DataAccessException;
	
	//게시글 수 가져오기
	public int getSecondhandBoardCount(HashMap<String, Object> map) throws DataAccessException;
	
	//게시글 작성
	public void insertSecondhand(Secondhand secondhand) throws DataAccessException;
	
	//게시글 상세보기
	public Secondhand getSecondhandDetail(int boardNum) throws DataAccessException;
	
	//게시글 수정
	public void updateSecondhand(Secondhand secondhand) throws DataAccessException;
	
	//게시글 삭제
	public void deleteSecondhand(int boardNum) throws DataAccessException;
	
	//조회 수 증가
	public void secondhandBoardHitPlus(int boardNum) throws DataAccessException;
	
	public void secondhandCartUpdate(Secondhand secondhand) throws DataAccessException;
	
	public void secondhandReplyCntUpdate(Secondhand secondhand) throws DataAccessException;
	
	public void secondhandIsSold(Secondhand secondhand)throws DataAccessException; // 판매완료
}
