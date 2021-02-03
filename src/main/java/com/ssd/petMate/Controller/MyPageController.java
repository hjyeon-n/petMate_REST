package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Order;
import com.ssd.petMate.domain.OrderCommand;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.domain.Review;
import com.ssd.petMate.domain.SOrderCommand;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.MyPageFacade;
import com.ssd.petMate.service.UserImpl;

@RestController
public class MyPageController {

	@Autowired
	private MyPageFacade myPageFacade;
	
	@Autowired
	   private UserImpl userService;
	
	@ModelAttribute("petsitterChk")
	  public int petsitterChk(HttpServletRequest request) {
	     if (request.getSession().getAttribute("userID") != null) {
	        return userService.isPetsitter(request.getSession().getAttribute("userID").toString());
	     }
	     return -1;
	 }
	
	//겹치는 코드가 많아 다중매핑
	@GetMapping(value = {"/mypage", "/mypage-info", "/mypage-inquiry", "/mypage-gpurchase", "/mypage-secondhand", "/mypage-petsitter", "/mypage-review"})
	public ModelAndView mypage(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword) {
		
		String userID = request.getSession().getAttribute("userID").toString();
		
//		검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("userID", userID);
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType);
		boardSearch.setKeyword(keyword);
		boardSearch.setUserID(userID);
		
		if (request.getServletPath().equals("/mypage") || request.getServletPath().equals("/mypage-info")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInfoCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Info> myboardList = myPageFacade.getPrivateInfoList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "정보게시판");
		}
		
		if (request.getServletPath().equals("/mypage-inquiry")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInquiryCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Inquiry> myboardList = myPageFacade.getPrivateInquiryList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "질문게시판");
		}
		
		if (request.getServletPath().equals("/mypage-gpurchase")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateGpurchaseCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Gpurchase> myboardList = myPageFacade.getPrivateGpurchaseList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "공구게시판");
		}
		
		if (request.getServletPath().equals("/mypage-secondhand")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateSecondhandCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Secondhand> myboardList = myPageFacade.getPrivateSecondhandList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "중고게시판");
		}
		
		if (request.getServletPath().equals("/mypage-petsitter")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
					int totalCount = myPageFacade.getPrivatePetsitterCount(map);
					boardSearch.pageInfo(pageNum, contentNum, totalCount);
					List<Petsitter> myboardList = myPageFacade.getPrivatePetsitterList(boardSearch);
					mv.addObject("myboardList", myboardList);
					mv.addObject("boardName", "매칭게시판");
		}
		
		if (request.getServletPath().equals("/mypage-review")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
					int totalCount = myPageFacade.getPrivateReviewCount(map);
					boardSearch.pageInfo(pageNum, contentNum, totalCount);
					List<Review> myboardList = myPageFacade.getPrivateReviewList(boardSearch);
					mv.addObject("myboardList", myboardList);
					mv.addObject("boardName", "리뷰게시판");
		}
		
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("mypage/myPage");
		return mv;
	}
	
	@GetMapping(value = {"/myreply", "/myreply-info", "/myreply-inquiry", "/myreply-gpurchase", 
			"/myreply-secondhand", "/myreply-petsitter", "/myreply-review"})
	public ModelAndView myReply(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword) {
		
		String userID = request.getSession().getAttribute("userID").toString();
		
//		검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("userID", userID);
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType);
		boardSearch.setKeyword(keyword);
		boardSearch.setUserID(userID);
		
		if (request.getServletPath().equals("/myreply") || request.getServletPath().equals("/myreply-info")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInfoReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Info> myboardList = myPageFacade.getPrivateInfoReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "정보게시판");
		}
		
		if (request.getServletPath().equals("/myreply-inquiry")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInquiryReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Inquiry> myboardList = myPageFacade.getPrivateInquiryReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "질문게시판");
		}
		
		if (request.getServletPath().equals("/myReplyGpurchase")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateGpurchaseReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Gpurchase> myboardList = myPageFacade.getPrivateGpurchaseReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "공구게시판");
		}
		
		if (request.getServletPath().equals("/myreply-secondhand")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateSecondhandReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Secondhand> myboardList = myPageFacade.getPrivateSecondhandReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "중고게시판");
		}
		
		if (request.getServletPath().equals("/myreply-petsitter")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivatePetsitterReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Petsitter> myboardList = myPageFacade.getPrivatePetsitterReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "구인게시판");
		}
		
		if (request.getServletPath().equals("/myreply-review")) {
			//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateReviewReplyCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Review> myboardList = myPageFacade.getPrivateReviewReplyList(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "리뷰게시판");
		}
		
		mv.addObject("boardSearch", boardSearch);
		mv.addObject("writerID", userID);
		mv.setViewName("mypage/myReply");
		return mv;
	}
	
	@GetMapping(value = "/myorder")
	public ModelAndView mypageOrderList(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum) {
		
		String userID = request.getSession().getAttribute("userID").toString();
		int totalCount = myPageFacade.getPrivateOrderListCount(userID);
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setUserID(userID);
	
//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<Order> myOrderList = myPageFacade.getPrivateOrderList(boardSearch);

		mv.addObject("myOrderList", myOrderList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("mypage/myOrderListPage");
		return mv;
	}
	
	@GetMapping(value = "/myorder/{orderNum}")
	public ModelAndView mypageOrderDetail(ModelAndView mv, HttpServletRequest request,
			@PathVariable("orderNum") int orderNum) {
		
		OrderCommand gOrder = myPageFacade.getOrderLineItems(orderNum);
		SOrderCommand sOrder = myPageFacade.getOrderSLineItems(orderNum);
		if(gOrder != null)
			gOrder.getTotalPrice();
		if(sOrder != null)
			sOrder.getTotalPrice();
		mv.addObject("gOrder", gOrder);
		mv.addObject("sOrder", sOrder);
		mv.setViewName("mypage/myOrderDetailPage");
		return mv;
	}
	
	@GetMapping(value = {"/mylike-info", "/mylike-inquiry", "/mylike-review", "/mylike-petsitter"})
	public ModelAndView myLike(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword) {
		
		String userID = request.getSession().getAttribute("userID").toString();
		
//		검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("userID", userID);
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType);
		boardSearch.setKeyword(keyword);
		boardSearch.setUserID(userID);
		
//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		if (request.getServletPath().equals("/mylike-info")) {
			int totalCount = myPageFacade.getPrivateInfoLikeCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Info> myboardList = myPageFacade.getPrivateInfoLike(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "정보게시판");
		}
		
		if (request.getServletPath().equals("/mylike-inquiry")) {
			int totalCount = myPageFacade.getPrivateInquiryLikeCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Inquiry> myboardList = myPageFacade.getPrivateInquiryLike(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "질문게시판");
		}
		
		if (request.getServletPath().equals("/mylike-review")) {
			int totalCount = myPageFacade.getPrivateReviewLikeCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Review> myboardList = myPageFacade.getPrivateReviewLike(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "리뷰게시판");
		}
		
		if (request.getServletPath().equals("/mylike-petsitter")) {
			int totalCount = myPageFacade.getPrivatePetsitterLikeCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Petsitter> myboardList = myPageFacade.getPrivatePetsitterLike(boardSearch);
			mv.addObject("myboardList", myboardList);
			mv.addObject("boardName", "구인게시판");
		}
		
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("mypage/myLike");
		return mv;
	}
	
}
