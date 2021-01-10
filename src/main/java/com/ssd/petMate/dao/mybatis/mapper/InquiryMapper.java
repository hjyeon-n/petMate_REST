package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.page.BoardSearch;

public interface InquiryMapper {
	public int boardPageCount(HashMap<String, Object> map); //게시판 페이징

	public List<Inquiry> getAllBoard(BoardSearch boardSearch); //게시글 목록
		
	public void insertBoard(Inquiry inquiry); //게시글 작성
	
	public Inquiry boardDetail(int boardNum); //게시글 상세보기
	
	public void updateBoard(Inquiry inquiry); //게시글 수정
	
	public void deleteBoard(int boardNum); //게시글 삭제
	
	public void updateViews(int boardNum); //조회수 증가
	
	void selectInquiry(int boardNum);
	
	public void updateLike(Inquiry like);
	
	public void updateReplyCnt(Inquiry inquiry);
}
