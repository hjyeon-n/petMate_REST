package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.InfoLike;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.InfoFacade;
import com.ssd.petMate.service.InfoLikeFacade;

@RestController
public class InfoController {
	
	@Autowired
	private InfoFacade infoFacade;
	
	@Autowired
	private InfoLikeFacade infoLikeFacade;

	@ApiOperation(value = "정보게시판 목록")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "pageNum", value = "페이지 번호", required = false, dataType = "int", paramType = "query", defaultValue = "1"),
			@ApiImplicitParam(name = "contentNum", value = "페이지 내 번호", required = false, dataType = "int", paramType = "query", defaultValue = "10"),
			@ApiImplicitParam(name = "searchType", value = "검색 종류", required = false, dataType = "string", paramType = "query", defaultValue = ""),
			@ApiImplicitParam(name = "keyword", value = "검색어", required = false, dataType = "string", paramType = "query", defaultValue = "")
	})
	@GetMapping(value = "/info")
	public ModelAndView infoBoard(ModelAndView mv, 
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

		int totalCount = infoFacade.boardPageCount(map);

//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<Info> infoList = infoFacade.getAllBoard(boardSearch);

		mv.addObject("infoList", infoList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("info/infoList");
		return mv;
	}

	@ApiOperation(value = "정보게시판 게시글 삭제")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "boardNum", value = "게시글 번호", dataType = "int", paramType = "path")
	})
	@DeleteMapping(value = "/info/{boardNum}")
	public String infoDelete(@PathVariable("boardNum") int boardNum) {
		infoFacade.deleteBoard(boardNum);
		return "success";
	}

	@ApiOperation(value = "정보게시판 게시글 내용")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "boardNum", value = "게시글 번호", dataType = "int", paramType = "path")
	})
	@GetMapping(value = "/info/{boardNum}")
	public ModelAndView infoDetail(ModelAndView mv, 
			@PathVariable("boardNum") int boardNum) {
		infoFacade.updateViews(boardNum);
		
		Info info = infoFacade.boardDetail(boardNum);
		
		if (info == null) {
			mv.setViewName("mypage/notFound");
		}
		else {
			mv.addObject("info", info);
			mv.setViewName("info/infoDetail");
		}
		return mv;
	}
	
//	게시글 추천 기능
	@ApiOperation(value = "정보게시판 게시글 추천")
	@ApiImplicitParams({
			@ApiImplicitParam(name = "boardNum", value = "게시글 번호", dataType = "int", paramType = "path")
	})
	@PostMapping(value="/info-like/{boardNum}")
//	@ResponseBody
	public HashMap<String, Integer> infoLike(ModelAndView mv, HttpServletRequest request,
			@PathVariable(required = false) int boardNum) {

		String userID = (String) request.getSession().getAttribute("userID");
		Info info = infoFacade.boardDetail(boardNum);
		InfoLike infoLike = new InfoLike(userID, boardNum);

//		이미 사용자가 게시글에 좋아요를 눌렀는지 누르지 않았는지 판별하기 위해 호출
		int count = infoLikeFacade.isLike(infoLike);
		
//		만약 이전에 좋아요를 누르지 않았을 때
//		게시글의 좋아요 개수가 증가하고, like 테이블에 좋아요를 누른 userID와 게시글의 ID가 삽입됨
		if (count == 0) {
			infoLikeFacade.insertLike(infoLike);
		}
		else {
			infoLikeFacade.deleteLike(infoLike);
		}
		
//		좋아요 개수 가지고 오기
		int boardLike = infoLikeFacade.countLike(boardNum);
		
//		좋아요 개수 update
		info.setBoardLike(boardLike);
		infoFacade.updateLike(info);
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		map.put("boardLike", boardLike);
		return map;
	}
}
