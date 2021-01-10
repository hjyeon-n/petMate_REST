package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.page.BoardSearch;

public interface InfoDao {
	List<Info> getAllBoard(BoardSearch boardSearch) throws DataAccessException;
	
	int boardPageCount(HashMap<String, Object> map) throws DataAccessException;
	
	Info boardDetail(int boardNum) throws DataAccessException;
	
	void insertBoard(Info info) throws DataAccessException; //게시글 작성
	
	void updateLike(Info info) throws DataAccessException;
	
	void updateReplyCnt(Info info) throws DataAccessException;
	
	void updateBoard(Info info) throws DataAccessException; //게시글 수정
	
	void deleteBoard(int boardNum); //게시글 삭제
	
	void updateViews(int boardNum);
}
