package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.page.BoardSearch;

public interface InfoMapper {
	int boardPageCount(HashMap<String, Object> map); //게시판 페이징

	List<Info> getAllBoard(BoardSearch boardSearch); //게시글 목록
		
	void insertBoard(Info info); //게시글 작성
	
	Info boardDetail(int boardNum); //게시글 상세보기
	
	void updateBoard(Info info); //게시글 수정
	
	void deleteBoard(int boardNum); //게시글 삭제
	
	void updateViews(int boardNum); //조회수 증가
	
	void updateLike(Info like);
	
	void updateReplyCnt(Info info);
}
