package com.ssd.petMate.service;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class InfoImpl implements InfoFacade { 
	
	@Autowired
	private InfoDao infoDao;

	public List<Info> getAllBoard(BoardSearch boardSearch){
		return infoDao.getAllBoard(boardSearch);
	}
	
	public int boardPageCount(HashMap<String, Object> map) {
		return infoDao.boardPageCount(map);
	}
	
	public Info boardDetail(int boardNum) {
		return infoDao.boardDetail(boardNum);
	}
	
	public void insertBoard(Info info) {
		infoDao.insertBoard(info);
	}
	
	public void updateLike(Info info) {
		infoDao.updateLike(info);
	}

	public void updateReplyCnt(Info info) {
		infoDao.updateReplyCnt(info);
	}

	@Override
	public void updateBoard(Info info) {
		infoDao.updateBoard(info);
	}

	@Override
	public void deleteBoard(int boardNum) {
		infoDao.deleteBoard(boardNum);
	}

	@Override
	public void updateViews(int boardNum) {
		// TODO Auto-generated method stub
		infoDao.updateViews(boardNum);
	}
}