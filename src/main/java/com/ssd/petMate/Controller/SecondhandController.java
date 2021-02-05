package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.SecondhandImpl;

@RestController
public class SecondhandController {	
	
	@Autowired
	private SecondhandImpl secondhandImpl;
	
	//중고 게시판 목록
	@GetMapping(value = "/secondhand")
	public ModelAndView secondhandList(ModelAndView mv,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword) {
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType);
		boardSearch.setKeyword(keyword);
		
//		검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);

		int totalCount = secondhandImpl.getSecondhandBoardCount(map);
//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<Secondhand> secondhandList = secondhandImpl.getSecondhandList(boardSearch);

		mv.addObject("secondhandList", secondhandList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("secondhand/secondhandList");
		return mv;
	}
	
	//중고게시판 글 상세보기
	@GetMapping(value = "/secondhand/{boardNum}")
	public ModelAndView secondhandDetail(ModelAndView mv,
			@PathVariable("boardNum") int boardNum) {
		secondhandImpl.secondhandBoardHitPlus(boardNum);
		Secondhand secondhand = secondhandImpl.getSecondhandDetail(boardNum);
		
		if (secondhand == null) {
			mv.setViewName("mypage/notFound");
		}
		else {
			mv.addObject("secondhand", secondhand);
			mv.setViewName("secondhand/secondhandDetail");
		}
		return mv;
	}
	
	//중고게시판 장바구니 목록
	@GetMapping("/secondhand-cart")
	public ModelAndView secondhandCartList(ModelAndView mv, HttpServletRequest request) {
		String userID = (String) request.getSession().getAttribute("userID");
		List<SecondhandCartCommand> secondhandCartList = secondhandImpl.getSecondhandCartListBySecondhand(userID);
		mv.addObject("secondhandCartList", secondhandCartList);
		mv.setViewName("order/secondhandCart");
		return mv;
	}
	
	//중고게시판 장바구니 담기
	@PostMapping(value="/secondhand-cart/{boardNum}")
	@ResponseBody
	public HashMap<String, Integer> secondhandCartAdded(ModelAndView mv, HttpServletRequest request,
			@PathVariable(required = false) int boardNum) {

		String userID = (String) request.getSession().getAttribute("userID");
		Secondhand secondhand = secondhandImpl.getSecondhandDetail(boardNum);
		SecondhandCart secondhandCart = new SecondhandCart(userID, boardNum);
		
		int count = secondhandImpl.isCart(secondhandCart);
		
		if (count == 0) {
			secondhandImpl.insertSecondhandCart(secondhandCart);
		}

		int cartAdded = secondhandImpl.countCartByboardNum(boardNum);

		secondhand.setCartAdded(cartAdded);
		secondhandImpl.secondhandCartUpdate(secondhand);
		secondhand = secondhandImpl.getSecondhandDetail(boardNum);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		map.put("cartAdded", cartAdded);
		
		return map;
		
	}
	
	//중고게시판 장바구니 삭제
	@DeleteMapping("/secondhand-cart/{boardNum}")
	public String secondhandCartDelete(@PathVariable(required = false) int boardNum, HttpServletRequest request) {
		String userID = (String) request.getSession().getAttribute("userID");
		Secondhand secondhand = secondhandImpl.getSecondhandDetail(boardNum);
		SecondhandCart secondhandCart = new SecondhandCart(userID, boardNum);
		
		secondhandImpl.deleteSecondhandCart(secondhandCart);
		
		int cartAdded = secondhandImpl.countCartByboardNum(boardNum);

		secondhand.setCartAdded(cartAdded);
		secondhandImpl.secondhandCartUpdate(secondhand);
		
		return "success";
	}	

	//중고물품 삭제
	@DeleteMapping(value = "secondhand/{boardNum}")
	public String secondhandDelete(@PathVariable("boardNum") int boardNum) {
		secondhandImpl.deleteSecondhand(boardNum);
		return "success";
	}
	
}