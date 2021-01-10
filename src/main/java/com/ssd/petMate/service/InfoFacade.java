package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.page.BoardSearch;

public interface InfoFacade {
	List<Info> getAllBoard(BoardSearch boardSearch);
	
	int boardPageCount(HashMap<String, Object> map);
	
	Info boardDetail(int boardNum);
	
	void insertBoard(Info info);
	
	void updateLike(Info info);
	
	void updateReplyCnt(Info info);
	
	void updateBoard(Info info); //게시글 수정
	
	void deleteBoard(int boardNum); //게시글 삭제
	
	void updateViews(int boardNum);
}