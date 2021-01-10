package com.ssd.petMate.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.PetsitterLike;
import com.ssd.petMate.domain.Code;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.page.BoardSearch;
import com.ssd.petMate.service.PetsitterFacade;
import com.ssd.petMate.service.PetsitterLikeFacade;
import com.ssd.petMate.service.UserImpl;

@Controller
public class PetsitterController {

	@Value("#{file['appkey']}")
	String appkey;

	@Autowired
	private PetsitterFacade petsitterFacade;

	@Autowired
	private UserImpl userService;

	@Autowired
	private PetsitterLikeFacade petsitterLikeFacade;

	@ModelAttribute("sizeCodes")
	public List<Code> referenceData1() {
		List<Code> sizeCodes = new ArrayList<Code>();
		sizeCodes.add(new Code("1", "소형　　　"));
		sizeCodes.add(new Code("2", "중형　　　"));
		sizeCodes.add(new Code("4", "대형"));

		return sizeCodes;
	}

	@ModelAttribute("dayCodes")
	public List<Code> referencData2() {
		List<Code> dayCodes = new ArrayList<Code>();
		dayCodes.add(new Code("1", "월요일　　"));
		dayCodes.add(new Code("2", "화요일　　"));
		dayCodes.add(new Code("4", "수요일　　"));
		dayCodes.add(new Code("8", "목요일　　"));
		dayCodes.add(new Code("16", "금요일　　"));
		dayCodes.add(new Code("32", "토요일　　"));
		dayCodes.add(new Code("64", "일요일"));

		return dayCodes;
	}

	@ModelAttribute("filtering")
	public FilteringCommand formBacking(HttpServletRequest request) throws Exception {
		return new FilteringCommand();
	}

	@ModelAttribute("petsitterChk")
	public int petsitterChk(HttpServletRequest request) {
		if (request.getSession().getAttribute("userID") != null) {
			return userService.isPetsitter(request.getSession().getAttribute("userID").toString());
		}
		return -1;
	}

	@RequestMapping(value = "/petsitterList", method = { RequestMethod.GET, RequestMethod.POST }) 
	public ModelAndView petsitterList(ModelAndView mv, @RequestParam(required = false, defaultValue = "1") int pageNum,
			@RequestParam(required = false, defaultValue = "10") int contentNum,  @RequestParam(required = false) String searchType,
			@RequestParam(required = false) String keyword, HttpServletRequest request, @ModelAttribute("filtering") FilteringCommand filter) {
		BoardSearch boardSearch = new BoardSearch();
		boardSearch.setSearchType(searchType); boardSearch.setKeyword(keyword);

		// 검색한 결과값을 가져오기 위해 map에 키워드와 검색 타입 저장 후 sql 쿼리에 삽입 
		HashMap<String, Object> map = new HashMap<String, Object>(); map.put("keyword", keyword);
		map.put("searchType", searchType);

		List<Petsitter> petsitterList = null;
		//GET방식인 경우 (그냥 리스트 출력하거나 검색기능)
		if (request.getMethod().equals("GET")) {
			int totalCount = petsitterFacade.boardPageCount(map);
			// 페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴 
			boardSearch.pageInfo(pageNum, contentNum,totalCount); 
			petsitterList = petsitterFacade.getAllBoard(boardSearch);
		}

		//POST방식인 경우(필터링 사용했을 때)
		if (request.getMethod().equals("POST")) {
			int sizeSum = 0;
			int daySum = 0;
			if (filter.getSizeCodes() != null) {
				for (String s : filter.getSizeCodes()) {
					sizeSum += Integer.parseInt(s);
				}
				filter.setPetSize(Integer.toString(sizeSum));
			}

			if (filter.getDayCodes() != null) {
				for (String s : filter.getDayCodes()) {
					daySum += Integer.parseInt(s);
				}
				filter.setPetDay(Integer.toString(daySum));
			}

			petsitterList = petsitterFacade.filtering(filter);
			int totalCount = petsitterFacade.filteringCount(filter);
			// 페이징과 검색 기능이 적용된 후의 리스트를 가지고 옴 
			boardSearch.pageInfo(pageNum, contentNum,totalCount);

		}

		mv.addObject("petsitterList", petsitterList);
		mv.addObject("boardSearch", boardSearch);
		mv.setViewName("petsitter/petsitterList"); 
		return mv; 
	}

	@RequestMapping(value = "/petsitterDetail", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView petsitterDetail(ModelAndView mv, @RequestParam("boardNum") int boardNum) {
		petsitterFacade.updateViews(boardNum);
		Petsitter view = petsitterFacade.boardDetail(boardNum);
		String size;
		String day;
		System.out.println(view);

		int sizeNum = Integer.parseInt(view.getPetSize());
		size = view.sizeCheck(sizeNum);

		int dayNum = Integer.parseInt(view.getPetDay());
		day = view.dayCheck(dayNum);

		mv.addObject("appkey", appkey);
		mv.addObject("petsitter", petsitterFacade.boardDetail(boardNum));
		mv.setViewName("petsitter/petsitterDetail");
		mv.addObject("size", size);
		mv.addObject("day", day);
		return mv;
	}

	@RequestMapping(value = "/petsitterDetail/delete", method = { RequestMethod.GET, RequestMethod.POST })
	public String petsitterDelete(@RequestParam("boardNum") int boardNum) {
		petsitterFacade.deleteBoard(boardNum);
		return "redirect:/petsitterList";
	}

	//      게시글 추천 기능
	@RequestMapping(value="/petsitterLike", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public HashMap<String, Integer> petsitterLike(ModelAndView mv, HttpServletRequest request,
			@RequestParam(required = false) int boardNum) {

		String userID = (String) request.getSession().getAttribute("userID");
		Petsitter petsitter = petsitterFacade.boardDetail(boardNum);
		PetsitterLike petsitterLike = new PetsitterLike(userID, boardNum);

		//         이미 사용자가 게시글에 좋아요를 눌렀는지 누르지 않았는지 판별하기 위해 호출
		int count = petsitterLikeFacade.isLike(petsitterLike);

		//         만약 이전에 좋아요를 누르지 않았을 때
		//         게시글의 좋아요 개수가 증가하고, like 테이블에 좋아요를 누른 userID와 게시글의 ID가 삽입됨
		if (count == 0) {
			petsitterLikeFacade.insertLike(petsitterLike);
		}
		else {
			petsitterLikeFacade.deleteLike(petsitterLike);
		}

		//         좋아요 개수 가지고 오기
		int boardLike = petsitterLikeFacade.countLike(boardNum);

		//         좋아요 개수 update
		petsitter.setBoardLike(boardLike);
		petsitterFacade.updateLike(petsitter);

		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("count", count);
		map.put("boardLike", boardLike);

		return map;
	}
}