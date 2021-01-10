package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.dao.SecondhandDao;
import com.ssd.petMate.dao.mybatis.mapper.InfoMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandMapper;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisSecondhandDao implements SecondhandDao {

	@Autowired
	private SecondhandMapper secondhandMapper;
	
	//게시글 목록
	public List<Secondhand> getSecondhandList(BoardSearch boardSearch) throws DataAccessException {
		return secondhandMapper.getSecondhandList(boardSearch);
	}
	
	//게시글 수 가져오기
	public int getSecondhandBoardCount(HashMap<String, Object> map) throws DataAccessException {
		return secondhandMapper.getSecondhandBoardCount(map);
	}
	
	//게시글 작성
	public void insertSecondhand(Secondhand secondhand) throws DataAccessException{
		secondhandMapper.insertSecondhand(secondhand);
	}
	
	//게시글 상세보기
	public Secondhand getSecondhandDetail(int boardNum) throws DataAccessException{
		return secondhandMapper.getSecondhandDetail(boardNum);
	}
	
	//게시글 수정
	public void updateSecondhand(Secondhand secondhand) throws DataAccessException{
		secondhandMapper.updateSecondhand(secondhand);
	}
	
	//게시글 삭제
	public void deleteSecondhand(int boardNum) throws DataAccessException{
		secondhandMapper.deleteSecondhand(boardNum);
	}
	
	//조회 수 증가
	public void secondhandBoardHitPlus(int boardNum) throws DataAccessException{
		secondhandMapper.secondhandBoardHitPlus(boardNum);
	}
	
	public void secondhandCartUpdate(Secondhand secondhand) throws DataAccessException{
		secondhandMapper.secondhandCartUpdate(secondhand);
	} //장바구니 담은 수 증가
	
	public void secondhandReplyCntUpdate(Secondhand secondhand) throws DataAccessException{
		secondhandMapper.secondhandReplyCntUpdate(secondhand);
	} //덧글수 증가
	
	public void secondhandIsSold(Secondhand secondhand)throws DataAccessException{ // 판매완료
		secondhandMapper.secondhandIsSold(secondhand);
	}

}