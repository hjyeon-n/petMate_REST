package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.domain.SecondhandReply;
import com.ssd.petMate.service.SecondhandFacade;
import com.ssd.petMate.service.SecondhandReplyFacade;

@RestController
public class SecondhandReplyController {

	@Autowired
	private SecondhandReplyFacade secondhandReplyFacade;
	
	@Autowired
	private SecondhandFacade secondhandFacade;
	
//	게시글 상세보기를 클릭했을 때 댓글 리스트 가져오기
	@GetMapping(value = "/secondhand/reply-list/{boardNum}")
	@ResponseBody
	public List<SecondhandReply> secondhandReplyList(ModelAndView mv,
			@PathVariable("boardNum") int boardNum) {
		List<SecondhandReply> secondhandReplyList = secondhandReplyFacade.getReplyList(boardNum);
		return secondhandReplyList;
	}
	
//	댓글 입력하기
	@PostMapping(value = "/secondhand/reply")
	@ResponseBody
	public void insertSecondhandReply(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("secondhandReply") SecondhandReply secondhandReply) {
		String userID = (String) request.getSession().getAttribute("userID");
		secondhandReply.setUserID(userID);
//		댓글 삽입
		secondhandReplyFacade.insertReply(secondhandReply);
//		게시글 목록에서 댓글 수 확인이 가능하도록 하기 위해 지정
		
		int replyCnt = secondhandReplyFacade.replyCnt(secondhandReply.getBoardNum());
		Secondhand secondhand = secondhandFacade.getSecondhandDetail(secondhandReply.getBoardNum());
		secondhand.setReplyCnt(replyCnt);
		
		secondhandFacade.secondhandReplyCntUpdate(secondhand);
	}
	
//	댓글 수정
	@PostMapping(value= "/secondhand/reply/{replyNum}")
    @ResponseBody
    public void updateSecondhandReply(ModelAndView mv,
    		@PathVariable("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) throws Exception{
        
		SecondhandReply reply = new SecondhandReply();
		reply.setReplyNum(replyNum);
		reply.setReplyContent(replyContent);

		secondhandReplyFacade.updateReply(reply);
    }
	
//	댓글 삭제
	@DeleteMapping(value = "/secondhand/reply/{replyNum}/{boardNum}")
	@ResponseBody
	public void deleteSecondhandReply(ModelAndView mv, HttpServletRequest request,
			@PathVariable("replyNum") int replyNum,
			@PathVariable("boardNum") int boardNum) {
		
		secondhandReplyFacade.deleteReply(replyNum); // 실제 댓글 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
		int replyCnt = secondhandReplyFacade.replyCnt(boardNum);
		Secondhand secondhand = secondhandFacade.getSecondhandDetail(boardNum);
		secondhand.setReplyCnt(replyCnt);
		secondhandFacade.secondhandReplyCntUpdate(secondhand);
	}
	
	//대댓글
	@PostMapping(value = "/secondhand/re-reply/{replyNum}")
	@ResponseBody
	public void movieReplyComment(ModelAndView mv, HttpServletRequest request,
			@PathVariable("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) {
		
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모  댓글
		SecondhandReply originalReply = secondhandReplyFacade.replyDetail(replyNum);
		
//		답글의 객체
		SecondhandReply reReply = new SecondhandReply();
		
//		답글의 GID는 부모 댓글의 ID
		reReply.setReplyParents(replyNum);

//		댓글과 답글의 정렬을 위해 지정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replyGID", reReply.getReplyGID());
		map.put("replyOrder", originalReply.getReplyOrder());
		secondhandReplyFacade.setReplyOrder(map);
		
		reReply.setReplyContent(replyContent);
		reReply.setReplyOrder(originalReply.getReplyOrder() + 1);
		reReply.setReplyGID(replyNum);
		reReply.setUserID(userID);
		reReply.setBoardNum(originalReply.getBoardNum());
		
		secondhandReplyFacade.insertReply(reReply);
		
		int replyCnt = secondhandReplyFacade.replyCnt(originalReply.getBoardNum());
		Secondhand secondhand = secondhandFacade.getSecondhandDetail(originalReply.getBoardNum());
		secondhand.setReplyCnt(replyCnt);
		
		secondhandFacade.secondhandReplyCntUpdate(secondhand);
	}
}
