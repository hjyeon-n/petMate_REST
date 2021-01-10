package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ssd.petMate.dao.InquiryDao;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class InquiryImpl implements InquiryFacade { 
	@Autowired
	private InquiryDao inquiryDao;

	
	public List<Inquiry> getAllBoard(BoardSearch boardSearch){
		return inquiryDao.getAllBoard(boardSearch);
	}
	
	public int boardPageCount(HashMap<String, Object> map) {
		return inquiryDao.boardPageCount(map);
	}
	
	public Inquiry boardDetail(int boardNum) {
		return inquiryDao.boardDetail(boardNum);
	}
	
	public void insertBoard(Inquiry inquiry) {
		inquiryDao.insertBoard(inquiry);
	}
	
	public void updateBoard(Inquiry inquiry) {
		inquiryDao.updateBoard(inquiry);
	}
	
	public void deleteBoard(int boardNum) {
		inquiryDao.deleteBoard(boardNum);
	}
	
	public void updateViews(int boardNum) {
		inquiryDao.updateViews(boardNum);
	}
	
	public void selectInquiry(int boardNum) {
		inquiryDao.selectInquiry(boardNum);
		
	}
	
	public void updateLike(Inquiry inquiry) {
		inquiryDao.updateLike(inquiry);
	}

	public void updateReplyCnt(Inquiry inquiry) {
		inquiryDao.updateReplyCnt(inquiry);
	}
	
}