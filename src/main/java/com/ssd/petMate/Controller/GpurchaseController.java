package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseCart;
import com.ssd.petMate.domain.GpurchaseCartCommand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.GpurchaseFacade;


@Controller
public class GpurchaseController {	
	
	@Autowired
	private GpurchaseFacade gpurchaseFacade;
	
	//공구 게시판 목록
	@GetMapping(value = "/gpurchase")
	public ModelAndView gpurchaseList(ModelAndView mv,
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

		int totalCount = gpurchaseFacade.getGpurchaseBoardCount(map);

//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<Gpurchase> gpurchaseList = gpurchaseFacade.getGpurchaseList(boardSearch);

		mv.addObject("gpurchaseList", gpurchaseList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("Gpurchase/GpurchaseList");
		return mv;
	}
	
	//공구게시판 글 상세보기
	@GetMapping(value = "/gpurchase/{boardNum}")
	public ModelAndView gpurchaseDetail(ModelAndView mv,
			@PathVariable("boardNum") int boardNum) {
		gpurchaseFacade.gpurchaseBoardHitPlus(boardNum);
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(boardNum);
		if (gpurchase == null) {
			mv.setViewName("mypage/notFound");
		}
		else {
			mv.addObject("gpurchase", gpurchase);
			mv.setViewName("Gpurchase/GpurchaseDetail");
		}
		return mv;
	}

	
	//공구게시판 장바구니 목록
	@GetMapping("/gpurchase-cart")
	public ModelAndView gpurchaseCartList(ModelAndView mv, HttpServletRequest request) {
		String userID = (String) request.getSession().getAttribute("userID");
		List<GpurchaseCartCommand> gpurchaseCartList = gpurchaseFacade.getGpurchaseCartListByGpurchase(userID);	
		mv.addObject("gpurchaseCartList", gpurchaseCartList);
		mv.setViewName("order/gpurchaseCart");
		return mv;
	}
	
//	장바구니 담기 기능
	@PostMapping(value="/gpurchase-cart")
	@ResponseBody
	public HashMap<String, Integer> gpurchaseCartAdded(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false) int boardNum) {

		String userID = (String) request.getSession().getAttribute("userID");
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(boardNum);
		GpurchaseCart gpurchaseCart = new GpurchaseCart(userID, boardNum);

//		이미 사용자가 게시글을 담았는지 판별하기 위해 호출
		int count = gpurchaseFacade.isCart(gpurchaseCart);
		
//		만약 담지 않았을 때
//		징바구니 개수가 증가하고, cart 테이블에 제품을 담은 userID와 게시글의 ID가 삽입됨
		if (count == 0) {
			gpurchaseFacade.insertGpurchaseCart(gpurchaseCart);
		}
		
//		장바구니 수 가지고 오기
		int cartAdded = gpurchaseFacade.countCartByboardNum(boardNum);
//		장바구니 개수 update
		gpurchase.setCartAdded(cartAdded);
		gpurchaseFacade.gpurchaseCartUpdate(gpurchase);
		gpurchase = gpurchaseFacade.getGpurchaseDetail(boardNum);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		map.put("cartAdded", cartAdded);
		
		return map;
	}
	
	//공구물품 삭제
	@DeleteMapping(value = "/gpurchase/{boardNum}")
	@ResponseBody
	public String secondhandDelete(@PathVariable("boardNum") int boardNum) {
		gpurchaseFacade.deleteGpurchase(boardNum);
		return "success";
	}
}