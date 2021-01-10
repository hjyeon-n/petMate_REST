package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandCart;
import com.ssd.petMate.domain.SecondhandCartCommand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.SecondhandImpl;
import com.ssd.petMate.service.UserImpl;

@Controller
public class SecondhandController {	
	
	@Autowired
	private SecondhandImpl secondhandImpl;
	
	@Autowired
	private UserImpl userService;
	
	@ModelAttribute("petsitterChk")
	public int petsitterChk(HttpServletRequest request) {
		if (request.getSession().getAttribute("userID") != null) {
			return userService.isPetsitter(request.getSession().getAttribute("userID").toString());
		}
		return -1;
	}
	
	//공구 게시판 목록
	@RequestMapping(value = "/secondhand", method = { RequestMethod.GET, RequestMethod.POST })
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
	@RequestMapping(value = "/secondhandDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView secondhandDetail(ModelAndView mv,
			@RequestParam("boardNum") int boardNum) {
		secondhandImpl.secondhandBoardHitPlus(boardNum);
		mv.addObject("secondhand", secondhandImpl.getSecondhandDetail(boardNum));
		mv.setViewName("secondhand/secondhandDetail");
		return mv;
	}
	
	//중고게시판 장바구니 목록
	@GetMapping("/secondhandCart")
	public ModelAndView secondhandCartList(ModelAndView mv, HttpServletRequest request) {
		String userID = (String) request.getSession().getAttribute("userID");
		List<SecondhandCartCommand> secondhandCartList = secondhandImpl.getSecondhandCartListBySecondhand(userID);
		mv.addObject("secondhandCartList", secondhandCartList);
		mv.setViewName("order/secondhandCart");
		return mv;
	}
	
	//중고게시판 장바구니 담기
	@RequestMapping(value="/secondhandCartAdded", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<String, Integer> secondhandCartAdded(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false) int boardNum) {

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
	@GetMapping("/secondhandCartDelete")
	public String secondhandCartDelete(@RequestParam(required = false) int boardNum, HttpServletRequest request) {
		String userID = (String) request.getSession().getAttribute("userID");
		Secondhand secondhand = secondhandImpl.getSecondhandDetail(boardNum);
		SecondhandCart secondhandCart = new SecondhandCart(userID, boardNum);
		
		secondhandImpl.deleteSecondhandCart(secondhandCart);
		
		int cartAdded = secondhandImpl.countCartByboardNum(boardNum);

		secondhand.setCartAdded(cartAdded);
		secondhandImpl.secondhandCartUpdate(secondhand);
		
		return "redirect:/secondhandCart";
	}	

	//중고물품 삭제
	@RequestMapping(value = "secondhandDetail/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String secondhandDelete(@RequestParam("boardNum") int boardNum) {
		secondhandImpl.deleteSecondhand(boardNum);
		return "redirect:/secondhand";
	}
	
}