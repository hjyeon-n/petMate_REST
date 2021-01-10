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

import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.domain.PetsitterReply;
import com.ssd.petMate.service.PetsitterFacade;
import com.ssd.petMate.service.PetsitterReplyFacade;

@Controller
public class PetsitterReplyController {

	@Autowired
	private PetsitterReplyFacade replyFacade;
	
	@Autowired
	private PetsitterFacade petsitterFacade;
	
//	게시글 상세보기를 클릭했을 때 댓글 리스트 가져오기
	@RequestMapping(value = "/petsitterReplyList", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<PetsitterReply> petsitterReplyList(ModelAndView mv,
			@RequestParam("boardNum") int boardNum) {
		List<PetsitterReply> replyList = replyFacade.getReplyList(boardNum);
		return replyList;
	}	
	
//	댓글 입력하기
	@RequestMapping(value = "/insertPetsitterReply", method = RequestMethod.POST)
	@ResponseBody
	public void insertPetsitterReply(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("petsitterReply") PetsitterReply petsitterReply) {
		String userID = (String) request.getSession().getAttribute("userID");
		petsitterReply.setUserID(userID);
//		댓글 삽입
		replyFacade.insertReply(petsitterReply);
//		게시글 목록에서 댓글 수 확인이 가능하도록 하기 위해 지정
		
		int replyCnt = replyFacade.replyCnt(petsitterReply.getBoardNum());
		Petsitter petsitter = petsitterFacade.boardDetail(petsitterReply.getBoardNum());
		petsitter.setReplyCnt(replyCnt);
		
		petsitterFacade.updateReplyCnt(petsitter);
	}
	
//	댓글 수정
	@RequestMapping(value= "/updatePetsitterReply", method = RequestMethod.POST) 
    @ResponseBody
    public void updatePetsitterReply(ModelAndView mv,
    		@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) throws Exception{
        
		PetsitterReply reply = new PetsitterReply();
		reply.setReplyNum(replyNum);
		reply.setReplyContent(replyContent);

		replyFacade.updateReply(reply);
    }
	
//	댓글 삭제
	@RequestMapping(value = "/deletePetsitterReply", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void deletePetsitterReply(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("boardNum") int boardNum) {
		
		replyFacade.deleteReply(replyNum); // 실제 댓글 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
		int replyCnt = replyFacade.replyCnt(boardNum);
		Petsitter petsitter = petsitterFacade.boardDetail(boardNum);
		petsitter.setReplyCnt(replyCnt);
		petsitterFacade.updateReplyCnt(petsitter);
	}
	
	@RequestMapping(value = "/petsitterReReply", method = RequestMethod.POST)
	@ResponseBody
	public void movieReplyComment(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) {
		
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모  댓글
		PetsitterReply originalReply = replyFacade.replyDetail(replyNum);
		
//		답글의 객체
		PetsitterReply reReply = new PetsitterReply();
		
//		답글의 GID는 부모 댓글의 ID
		reReply.setReplyParents(replyNum);

//		댓글과 답글의 정렬을 위해 지정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replyGID", reReply.getReplyGID());
		map.put("replyOrder", originalReply.getReplyOrder());
		replyFacade.setReplyOrder(map);
		
		reReply.setReplyContent(replyContent);
		reReply.setReplyOrder(originalReply.getReplyOrder() + 1);
		reReply.setReplyGID(replyNum);
		reReply.setUserID(userID);
		reReply.setBoardNum(originalReply.getBoardNum());
		
		replyFacade.insertReply(reReply);
		
		int replyCnt = replyFacade.replyCnt(originalReply.getBoardNum());
		Petsitter petsitter = petsitterFacade.boardDetail(originalReply.getBoardNum());
		petsitter.setReplyCnt(replyCnt);
		
		petsitterFacade.updateReplyCnt(petsitter);
	}
	
	@RequestMapping(value="/selectPetsitter", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selecetPetsitter(ModelAndView mv, HttpServletRequest request, 
			@RequestParam("boardNum") int boardNum,
			@RequestParam("replyNum") int replyNum, @RequestParam("userID") String userID) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardNum", boardNum);
		map.put("isSelected", userID);
		petsitterFacade.selectPetsitter(map);
		replyFacade.petsitterReplySelect(replyNum);
	}
}
