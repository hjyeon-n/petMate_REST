package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Review;
import com.ssd.petMate.page.BoardSearch;

public interface ReviewMapper {
	public int boardPageCount(HashMap<String, Object> map); //게시판 페이징

	public List<Review> getAllBoard(BoardSearch boardSearch); //게시글 목록
	
	public void insertBoard(Review review); //게시글 작성
	
	public Review boardDetail(int boardNum); //게시글 상세보기
	
	public void updateBoard(Review review); //게시글 수정
	
	public void deleteBoard(int boardNum); //게시글 삭제
	
	public void updateViews(int boardNum); //조회수 증가
	
	public void updateLike(Review like);
	
	public void updateReplyCnt(Review review);
	
	public List<String> petsitterChoice(String userID);
	
	public int petsitterCount(String userID);
}
