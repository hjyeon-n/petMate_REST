package com.ssd.petMate.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.UserFacade;

@Controller
public class AdminController {
	
	@Autowired
	private UserFacade userFacade;
	
//	관리자 페이지
	@RequestMapping(value = "/admin", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView admin(ModelAndView mv,
			@RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,
			@RequestParam(required = false) String keyword) {
		
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setKeyword(keyword);

		int totalCount = userFacade.userCount(keyword);

//		페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴
		boardSearch.pageInfo(pageNum, contentNum, totalCount);
		List<UserList> userList = userFacade.getAllUser(boardSearch);
		
		mv.addObject("userList", userList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("admin/adminPage");
		return mv;
	}
}
