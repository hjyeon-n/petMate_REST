package com.ssd.petMate.dao.mybatis;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.InquiryLikeDao;
import com.ssd.petMate.dao.mybatis.mapper.InquiryLikeMapper;
import com.ssd.petMate.domain.InquiryLike;

@Repository
public class MybatisInquiryLikeDao implements InquiryLikeDao{
	
	@Autowired
	private InquiryLikeMapper inquiryLikeMapper;
	
	public void insertLike(InquiryLike inquiryLike) throws DataAccessException {
		inquiryLikeMapper.insertLike(inquiryLike);
	}
	
	public void deleteLike(InquiryLike inquiryLike) throws DataAccessException {
		inquiryLikeMapper.deleteLike(inquiryLike);
	}
	
	public int countLike(int boardNum) throws DataAccessException {
		return inquiryLikeMapper.countLike(boardNum);
	}

	public int isLike(InquiryLike inquiryLike) throws DataAccessException {
		return inquiryLikeMapper.isLike(inquiryLike);
	}
}
