package com.ssd.petMate.dao;

import java.util.HashMap;
import java.util.List;
import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.page.BoardSearch;

public interface InquiryDao {
	public List<Inquiry> getAllBoard(BoardSearch boardSearch) throws DataAccessException;
	public int boardPageCount(HashMap<String, Object> map) throws DataAccessException;
	public Inquiry boardDetail(int boardNum) throws DataAccessException;
	public void insertBoard(Inquiry inquiry); //게시글 작성
	public void updateBoard(Inquiry inquiry);
	public void deleteBoard(int boardNum);
	public void updateViews(int boardNum);
	public void selectInquiry(int boardNum)throws DataAccessException;
	public void updateLike(Inquiry inquiry) throws DataAccessException;
	public void updateReplyCnt(Inquiry inquiry) throws DataAccessException;
}
