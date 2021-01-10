package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.page.BoardSearch;

public interface GpurchaseDao {
//	public List<Info> getAllBoard(BoardSearch boardSearch) throws DataAccessException;
//	public int boardPageCount(HashMap<String, Object> map) throws DataAccessException;
//	public Info boardDetail(int boardNum) throws DataAccessException;
	
	public List<Gpurchase> getGpurchaseList(BoardSearch boardSearch) throws DataAccessException; //게시글 목록
	
	public int getGpurchaseBoardCount(HashMap<String, Object> map) throws DataAccessException; //게시글 수 가져오기
	
//	public int boardCount(); //게시글 개수 가져오기
	
	public void insertGpurchase(Gpurchase gpurchase)throws DataAccessException; //게시글 작성
	
	public Gpurchase getGpurchaseDetail(int boardNum) throws DataAccessException; //게시글 상세보기
	
	public void updateGpurchase(Gpurchase Gpurchase) throws DataAccessException; //게시글 수정
	
	public void deleteGpurchase(int boardNum) throws DataAccessException; //게시글 삭제
	
	public void gpurchaseBoardHitPlus(int boardNum) throws DataAccessException; //조회수 증가
	
	public void gpurchaseReplyCntUpdate(Gpurchase gpurchase) throws DataAccessException; //덧글수 업데이틑
	
	public void gpurchaseCartUpdate(Gpurchase gpurchase) throws DataAccessException; //장바구니 담은 수 업데이트
	
	public void updateResult(Gpurchase gpurchase) throws DataAccessException;
	
	public void updateParticipant(int boardNum) throws DataAccessException;//공동구매 참여자 수 증가
}
