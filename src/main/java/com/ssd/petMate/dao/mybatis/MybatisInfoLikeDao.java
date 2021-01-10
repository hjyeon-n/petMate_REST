package com.ssd.petMate.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.InfoLikeDao;
import com.ssd.petMate.dao.mybatis.mapper.InfoLikeMapper;
import com.ssd.petMate.domain.InfoLike;

@Repository
public class MybatisInfoLikeDao implements InfoLikeDao{
	
	@Autowired
	private InfoLikeMapper infoLikeMapper;
	
	public void insertLike(InfoLike infoLike) throws DataAccessException {
		infoLikeMapper.insertLike(infoLike);
	}
	
	public void deleteLike(InfoLike infoLike) throws DataAccessException {
		infoLikeMapper.deleteLike(infoLike);
	}
	
	public int countLike(int boardNum) throws DataAccessException {
		return infoLikeMapper.countLike(boardNum);
	}

	public int isLike(InfoLike infoLike) throws DataAccessException {
		return infoLikeMapper.isLike(infoLike);
	}
}
