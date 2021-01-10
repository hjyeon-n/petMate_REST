package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.dao.mybatis.mapper.InfoMapper;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisInfoDao implements InfoDao {

	@Autowired
	private InfoMapper infoMapper;
	
	public List<Info> getAllBoard(BoardSearch boardSearch) throws DataAccessException {
		return infoMapper.getAllBoard(boardSearch);
	}
	
	public int boardPageCount(HashMap<String, Object> map) throws DataAccessException {
		return infoMapper.boardPageCount(map);
	}
	
	public Info boardDetail(int boardNum) throws DataAccessException {
		return infoMapper.boardDetail(boardNum);
	}

	public void insertBoard(Info info) throws DataAccessException{
		infoMapper.insertBoard(info);
	}

	public void updateLike(Info info) throws DataAccessException {
		infoMapper.updateLike(info);
	}

	public void updateReplyCnt(Info info) throws DataAccessException {
		infoMapper.updateReplyCnt(info);
	}

	@Override
	public void updateBoard(Info info) throws DataAccessException {
		infoMapper.updateBoard(info);
	}

	@Override
	public void deleteBoard(int boardNum) {
		infoMapper.deleteBoard(boardNum);
	}

	@Override
	public void updateViews(int boardNum) {
		// TODO Auto-generated method stub
		infoMapper.updateViews(boardNum);
	}
}