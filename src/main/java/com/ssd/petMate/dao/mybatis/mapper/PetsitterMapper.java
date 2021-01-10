package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.Controller.FilteringCommand;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.page.BoardSearch;

public interface PetsitterMapper {
	int boardPageCount(HashMap<String, Object> map); //게시판 페이징
	
	List<Petsitter> getAllBoard(BoardSearch boardSearch); //게시글 목록
	
	void insertBoard(Petsitter petsitter); //게시글 작성
	
	Petsitter boardDetail(int boardNum); //게시글 상세보기
	
	void updateBoard(Petsitter petsitter); //게시글 수정
	
	void deleteBoard(int boardNum); //게시글 삭제
	
	void updateLike(Petsitter petsitter);
	
	void updateReplyCnt(Petsitter petistter);
	
	void updateViews(int boardNum); //조회수 증가

	List<Petsitter> filtering(FilteringCommand filter);
	
	void selectPetsitter(HashMap<String, Object> map);
	
	int filteringCount(FilteringCommand filter);
}
