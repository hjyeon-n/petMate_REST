package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.page.pageMaker;

public interface SecondhandMapper {
	
	List<Secondhand> getSecondhandList(BoardSearch boardSearch); //게시글 목록
	
	int getSecondhandBoardCount(HashMap<String, Object> map); //게시글 수 가져오기
	
//	public int boardCount(); //게시글 개수 가져오기
	
	void insertSecondhand(Secondhand secondhand); //게시글 작성
	
	Secondhand getSecondhandDetail(int boardNum); //게시글 상세보기
	
	void updateSecondhand(Secondhand secondhand); //게시글 수정
	
	void deleteSecondhand(int boardNum); //게시글 삭제
	
	void secondhandBoardHitPlus(int boardNum); //조회수 증가
	
	void secondhandReplyCntUpdate(Secondhand secondhand); //덧글수 업데이틑
	
	void secondhandCartUpdate(Secondhand secondhand); //장바구니 담은 수 업데이트
	
	void secondhandIsSold(Secondhand secondhand); // 판매완료
	
	
}
