package com.ssd.petMate.dao.mybatis;

import java.util.HashMap;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.GpurchaseDao;
import com.ssd.petMate.dao.InfoDao;
import com.ssd.petMate.dao.SecondhandDao;
import com.ssd.petMate.dao.mybatis.mapper.GpurchaseMapper;
import com.ssd.petMate.dao.mybatis.mapper.InfoMapper;
import com.ssd.petMate.dao.mybatis.mapper.SecondhandMapper;
import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisGpurchaseDao implements GpurchaseDao {

	@Autowired
	private GpurchaseMapper gpurchaseMapper;
	
	//게시글 목록
	public List<Gpurchase> getGpurchaseList(BoardSearch boardSearch) throws DataAccessException {
		return gpurchaseMapper.getGpurchaseList(boardSearch);
	}
	
	//게시글 수 가져오기
	public int getGpurchaseBoardCount(HashMap<String, Object> map) throws DataAccessException {
		return gpurchaseMapper.getGpurchaseBoardCount(map);
	}
	
	//게시글 작성
	public void insertGpurchase(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseMapper.insertGpurchase(gpurchase);
	}
	
	//게시글 상세보기
	public Gpurchase getGpurchaseDetail(int boardNum) throws DataAccessException{
		return gpurchaseMapper.getGpurchaseDetail(boardNum);
	}
	
	//게시글 수정
	public void updateGpurchase(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseMapper.updateGpurchase(gpurchase);
	}
	
	//게시글 삭제
	public void deleteGpurchase(int boardNum) throws DataAccessException{
		gpurchaseMapper.deleteGpurchase(boardNum);
	}
	
	//조회 수 증가
	public void gpurchaseBoardHitPlus(int boardNum) throws DataAccessException{
		gpurchaseMapper.gpurchaseBoardHitPlus(boardNum);
	}
	
	public void gpurchaseCartUpdate(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseMapper.gpurchaseCartUpdate(gpurchase);
	} //장바구니 담은 수 증가
	
	public void gpurchaseReplyCntUpdate(Gpurchase gpurchase) throws DataAccessException{
		gpurchaseMapper.gpurchaseReplyCntUpdate(gpurchase);
	} //덧글수 증가

	@Override
	public void updateResult(Gpurchase gpurchase) throws DataAccessException {
		// TODO Auto-generated method stub
		gpurchaseMapper.updateResult(gpurchase);
	}
	
	//공동구매 참여자 수 증가
	public void updateParticipant(int boardNum) throws DataAccessException{
		gpurchaseMapper.updateParticipant(boardNum);
	}
}