package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.page.pageMaker;

public interface GpurchaseMapper {
	
	public List<Gpurchase> getGpurchaseList(BoardSearch boardSearch); //게시글 목록
	
	public int getGpurchaseBoardCount(HashMap<String, Object> map); //게시글 수 가져오기
	
//	public int boardCount(); //게시글 개수 가져오기
	
	public void insertGpurchase(Gpurchase gpurchase); //게시글 작성
	
	public Gpurchase getGpurchaseDetail(int boardNum); //게시글 상세보기
	
	public void updateGpurchase(Gpurchase gpurchase); //게시글 수정
	
	public void deleteGpurchase(int boardNum); //게시글 삭제
	
	public void gpurchaseBoardHitPlus(int boardNum); //조회수 증가
	
	public void gpurchaseReplyCntUpdate(Gpurchase gpurchase); //덧글수 업데이틑
	
	public void gpurchaseCartUpdate(Gpurchase gpurchase); //장바구니 담은 수 업데이트
	
	public void updateResult(Gpurchase gpurchase); // 공동구매 결과 업데이트
	
	void updateParticipant(int boardNum);//공동구매 참여자 수 증가
}
