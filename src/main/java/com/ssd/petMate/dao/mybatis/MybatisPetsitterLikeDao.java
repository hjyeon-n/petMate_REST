package com.ssd.petMate.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.PetsitterLikeDao;
import com.ssd.petMate.dao.mybatis.mapper.PetsitterLikeMapper;
import com.ssd.petMate.domain.PetsitterLike;

@Repository
public class MybatisPetsitterLikeDao implements PetsitterLikeDao{
	
	@Autowired
	private PetsitterLikeMapper petsitterLikeMapper;
	
	public void insertLike(PetsitterLike petsitterLike) throws DataAccessException {
		petsitterLikeMapper.insertLike(petsitterLike);
	}
	
	public void deleteLike(PetsitterLike petsitterLike) throws DataAccessException {
		petsitterLikeMapper.deleteLike(petsitterLike);
	}
	
	public int countLike(int boardNum) throws DataAccessException {
		return petsitterLikeMapper.countLike(boardNum);
	}

	public int isLike(PetsitterLike infoLike) throws DataAccessException {
		return petsitterLikeMapper.isLike(infoLike);
	}
}
