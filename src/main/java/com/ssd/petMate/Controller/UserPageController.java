package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.domain.Review;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.MyPageFacade;
import com.ssd.petMate.service.UserFacade;

@Controller
public class UserPageController {
	
	@Autowired
	private UserFacade userFacade;
	
	@Autowired
	private MyPageFacade myPageFacade;
	
	@RequestMapping(value = {"/userpage",  "/userInfo", "/userInquiry", "/userGpurchase", "/userSecondhand", "/userPetsitter", "/userReview"})
	public ModelAndView userpage(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword,
			@RequestParam String userID) {
		
//		검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("searchType", searchType);
		map.put("userID", userID);
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType);
		boardSearch.setKeyword(keyword);
		boardSearch.setUserID(userID);
		
		//펫시터 회원인지 아닌지 판별하기 위함
		int petsitterChk = userFacade.isPetsitter(userID);
	
		if (request.getServletPath().equals("/userpage") || request.getServletPath().equals("/userInfo")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInfoCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Info> userBoardList = myPageFacade.getPrivateInfoList(boardSearch);
	
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "정보게시판");
		}
		
		if (request.getServletPath().equals("/userInquiry")) {
	//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateInquiryCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Inquiry> userBoardList = myPageFacade.getPrivateInquiryList(boardSearch);
	
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "질문게시판");
		}
		
		if (request.getServletPath().equals("/userGpurchase")) {
		//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateGpurchaseCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);
			List<Gpurchase> userBoardList = myPageFacade.getPrivateGpurchaseList(boardSearch);
			
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "공구게시판");
		}
		
		if (request.getServletPath().equals("/userSecondhand")) {
		//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateSecondhandCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);	
			List<Secondhand> userBoardList = myPageFacade.getPrivateSecondhandList(boardSearch);
				
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "중고게시판");
		}	

		if (request.getServletPath().equals("/userPetsitter")) {
		//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivatePetsitterCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);	
			List<Petsitter> userBoardList = myPageFacade.getPrivatePetsitterList(boardSearch);
				
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "매칭게시판");
		}
	
		if (request.getServletPath().equals("/userReview")) {
		//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
			int totalCount = myPageFacade.getPrivateReviewCount(map);
			boardSearch.pageInfo(pageNum, contentNum, totalCount);	
			List<Review> userBoardList = myPageFacade.getPrivateReviewList(boardSearch);
				
			mv.addObject("userBoardList", userBoardList);
			mv.addObject("boardName", "리뷰게시판");
		}
		
		mv.addObject("boardSearch", boardSearch);
		mv.addObject("writerID", userID);
		mv.addObject("petsitterChk", petsitterChk);
		mv.setViewName("admin/userPage");
		return mv;
	}

}
