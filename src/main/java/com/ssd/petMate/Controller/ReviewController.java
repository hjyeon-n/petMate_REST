package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Review;
import com.ssd.petMate.domain.ReviewLike;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.ReviewLikeFacade;
import com.ssd.petMate.service.UserImpl;
import com.ssd.petMate.service.ReviewFacade;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewFacade reviewFacade;
	
	@Autowired
	private ReviewLikeFacade reviewLikeFacade;
	
	@Autowired
	private UserImpl userService;
	
	@ModelAttribute("petsitterChk")
	public int petsitterChk(HttpServletRequest request) {
		if (request.getSession().getAttribute("userID") != null) {
			return userService.isPetsitter(request.getSession().getAttribute("userID").toString());
		}
		return -1;
	}
	
	@RequestMapping(value = "/reviewDelete", method = { RequestMethod.GET, RequestMethod.POST })
	public String reviewDelete(@RequestParam("boardNum") int boardNum) {
		reviewFacade.deleteBoard(boardNum);
		return "redirect:/review";
	}
	
	@RequestMapping(value = "/reviewDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewDetail(ModelAndView mv, 
			@RequestParam("boardNum") int boardNum) {
		reviewFacade.updateViews(boardNum);
		mv.addObject("review", reviewFacade.boardDetail(boardNum));
		mv.setViewName("review/reviewDetail");
		return mv;
	}
	
	@RequestMapping(value = "/review", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView reviewBoard(ModelAndView mv, HttpServletRequest request,
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

		int totalCount = reviewFacade.boardPageCount(map);

//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<Review> reviewList = reviewFacade.getAllBoard(boardSearch);
		
		String userID = (String) request.getSession().getAttribute("userID");
		if (userID != null) {
			int count = reviewFacade.petsitterCount(userID);
			mv.addObject("count", count);
		}

		mv.addObject("reviewList", reviewList);
		mv.addObject("boardSearch", boardSearch);
		
		mv.setViewName("review/reviewList");
		return mv;
	}
	
//	게시글 추천 기능
	@RequestMapping(value="/reviewLike", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<String, Integer> reviewLike(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false) int boardNum) {

		String userID = (String) request.getSession().getAttribute("userID");
		Review review = reviewFacade.boardDetail(boardNum);
		ReviewLike reviewLike = new ReviewLike(userID, boardNum);

//		이미 사용자가 게시글에 좋아요를 눌렀는지 누르지 않았는지 판별하기 위해 호출
		int count = reviewLikeFacade.isLike(reviewLike);
		
//		만약 이전에 좋아요를 누르지 않았을 때
//		게시글의 좋아요 개수가 증가하고, like 테이블에 좋아요를 누른 userID와 게시글의 ID가 삽입됨
		if (count == 0) {
			reviewLikeFacade.insertLike(reviewLike);
		}
		else {
			reviewLikeFacade.deleteLike(reviewLike);
		}
		
//		좋아요 개수 가지고 오기
		int boardLike = reviewLikeFacade.countLike(boardNum);
		
//		좋아요 개수 update
		review.setBoardLike(boardLike);
		reviewFacade.updateLike(review);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		map.put("boardLike", boardLike);
		
		return map;
	}
}