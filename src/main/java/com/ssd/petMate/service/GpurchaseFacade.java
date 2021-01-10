package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.page.BoardSearch;

public interface GpurchaseFacade {

	List<Gpurchase> getGpurchaseList(BoardSearch boardSearch); //게시글 목록

	int getGpurchaseBoardCount(HashMap<String, Object> map); //게시글 수 가져오기
		
	void insertGpurchase(Gpurchase gpurchase); //게시글 작성
	
	Gpurchase getGpurchaseDetail(int boardNum); //게시글 상세보기
	
	void updateGpurchase(Gpurchase gpurchase); //게시글 수정
	
	void deleteGpurchase(int boardNum); //게시글 삭제
	
	void gpurchaseBoardHitPlus(int boardNum); //조회수 증가
	
	void gpurchaseCartUpdate(Gpurchase gpurchase); //장바구니 담은 수 증가
	
	void gpurchaseReplyCntUpdate(Gpurchase gpurchase); //덧글수 업데이틑
	
	void updateParticipant(int boardNum);//참여자 수 증가
	
	List<GpurchaseCartCommand> getGpurchaseCartListByGpurchase(String userID); //cart+gpuchase
	
	void insertGpurchaseCart(GpurchaseCart gpurchaseCart); //장바구니 추가
	
	void deleteGpurchaseCart(GpurchaseCart gpurchaseCart); //장바구니 삭제
	
	int countCartByboardNum(int boardNum); // 게시글에 대한 담은 장바구니 총 개수
	
	int isCart(GpurchaseCart gpurchaseCart); //이 게시글을 사용자가 담았는지 확인
	
	void updateResult(Gpurchase gpurchase); // 공동구매 결과 업데이트
	
	void deleteFinished();
}