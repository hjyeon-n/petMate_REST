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

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.InfoReply;
import com.ssd.petMate.service.InfoFacade;
import com.ssd.petMate.service.InfoReplyFacade;

@Controller
public class InfoReplyController {

	@Autowired
	private InfoReplyFacade replyFacade;
	
	@Autowired
	private InfoFacade infoFacade;
	
//	게시글 상세보기를 클릭했을 때 댓글 리스트 가져오기
	@RequestMapping(value = "/infoReplyList", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<InfoReply> infoReplyList(ModelAndView mv,
			@RequestParam("boardNum") int boardNum) {
		List<InfoReply> replyList = replyFacade.getReplyList(boardNum);
		return replyList;
	}	
	
//	댓글 입력하기
	@RequestMapping(value = "/insertInfoReply", method = RequestMethod.POST)
	@ResponseBody
	public void insertInfoReply(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("infoReply") InfoReply infoReply) {
		String userID = (String) request.getSession().getAttribute("userID");
		infoReply.setUserID(userID);
//		댓글 삽입
		replyFacade.insertReply(infoReply);
//		게시글 목록에서 댓글 수 확인이 가능하도록 하기 위해 지정
		
		int replyCnt = replyFacade.replyCnt(infoReply.getBoardNum());
		Info info = infoFacade.boardDetail(infoReply.getBoardNum());
		info.setReplyCnt(replyCnt);
		
		infoFacade.updateReplyCnt(info);
	}
	
//	댓글 수정
	@RequestMapping(value= "/updateInfoReply", method = RequestMethod.POST) 
    @ResponseBody
    public void updateInfoReply(ModelAndView mv,
    		@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) throws Exception{
        
		InfoReply reply = new InfoReply();
		reply.setReplyNum(replyNum);
		reply.setReplyContent(replyContent);

		replyFacade.updateReply(reply);
    }
	
//	댓글 삭제
	@RequestMapping(value = "/deleteInfoReply", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void deleteInfoReply(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("boardNum") int boardNum) {
		
		replyFacade.deleteReply(replyNum); // 실제 댓글 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
		int replyCnt = replyFacade.replyCnt(boardNum);
		Info info = infoFacade.boardDetail(boardNum);
		info.setReplyCnt(replyCnt);
		infoFacade.updateReplyCnt(info);
	}
	
	@RequestMapping(value = "/infoReReply", method = RequestMethod.POST)
	@ResponseBody
	public void movieReplyComment(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) {
		
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모  댓글
		InfoReply originalReply = replyFacade.replyDetail(replyNum);
		
//		답글의 객체
		InfoReply reReply = new InfoReply();
		
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
		Info info = infoFacade.boardDetail(originalReply.getBoardNum());
		info.setReplyCnt(replyCnt);
		
		infoFacade.updateReplyCnt(info);
	}
}
