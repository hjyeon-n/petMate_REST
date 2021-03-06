package com.ssd.petMate.Controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.GpurchaseReply;
import com.ssd.petMate.service.GpurchaseFacade;
import com.ssd.petMate.service.GpurchaseReplyFacade;

@RestController
public class GpurchaseReplyController {

	@Autowired
	private GpurchaseReplyFacade gpurchaseReplyFacade;
	
	@Autowired
	private GpurchaseFacade gpurchaseFacade;
	
//	게시글 상세보기를 클릭했을 때 댓글 리스트 가져오기
	@GetMapping(value = "/gpurchase/reply-list/{boardNum}")
	public List<GpurchaseReply> gpurchaseReplyList(ModelAndView mv,
			@PathVariable("boardNum") int boardNum) {
		List<GpurchaseReply> gpurchaseReplyList = gpurchaseReplyFacade.getReplyList(boardNum);
		return gpurchaseReplyList;
	}
	
//	댓글 입력하기
	@PostMapping(value = "/gpurchase/reply")
	public void insertGpurchaseReply(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("gpurhcaseReply") GpurchaseReply gpurchaseReply) {
		String userID = (String) request.getSession().getAttribute("userID");
		gpurchaseReply.setUserID(userID);
//		댓글 삽입
		gpurchaseReplyFacade.insertReply(gpurchaseReply);
//		게시글 목록에서 댓글 수 확인이 가능하도록 하기 위해 지정
		
		int replyCnt = gpurchaseReplyFacade.replyCnt(gpurchaseReply.getBoardNum());
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(gpurchaseReply.getBoardNum());
		gpurchase.setReplyCnt(replyCnt);
		
		gpurchaseFacade.gpurchaseReplyCntUpdate(gpurchase);
	}
	
//	댓글 수정
	@PostMapping(value= "/gpurchase/reply/{replyNum}") 
    @ResponseBody
    public void updateGpurchaseReply(ModelAndView mv,
    		@PathVariable("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) throws Exception{
        
		GpurchaseReply reply = new GpurchaseReply();
		reply.setReplyNum(replyNum);
		reply.setReplyContent(replyContent);

		gpurchaseReplyFacade.updateReply(reply);
    }
	
//	댓글 삭제
	@DeleteMapping(value = "/gpurchase/reply/{replyNum}/{boardNum}")
	@ResponseBody
	public void deleteGpurchaseReply(ModelAndView mv, HttpServletRequest request,
			@PathVariable("replyNum") int replyNum,
			@PathVariable("boardNum") int boardNum) {
		
		gpurchaseReplyFacade.deleteReply(replyNum); // 실제 댓글 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
		int replyCnt = gpurchaseReplyFacade.replyCnt(boardNum);
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(boardNum);
		gpurchase.setReplyCnt(replyCnt);
		gpurchaseFacade.gpurchaseReplyCntUpdate(gpurchase);
	}
	
	//대댓글
	@RequestMapping(value = "/gpurchase/re-reply/{replyNum}", method = RequestMethod.POST)
	@ResponseBody
	public void movieReplyComment(ModelAndView mv, HttpServletRequest request,
			@PathVariable("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) {
		
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모  댓글
		GpurchaseReply originalReply = gpurchaseReplyFacade.replyDetail(replyNum);
		
//		답글의 객체
		GpurchaseReply reReply = new GpurchaseReply();
		
//		답글의 GID는 부모 댓글의 ID
		reReply.setReplyParents(replyNum);

//		댓글과 답글의 정렬을 위해 지정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replyGID", reReply.getReplyGID());
		map.put("replyOrder", originalReply.getReplyOrder());
		gpurchaseReplyFacade.setReplyOrder(map);
		
		reReply.setReplyContent(replyContent);
		reReply.setReplyOrder(originalReply.getReplyOrder() + 1);
		reReply.setReplyGID(replyNum);
		reReply.setUserID(userID);
		reReply.setBoardNum(originalReply.getBoardNum());
		
		gpurchaseReplyFacade.insertReply(reReply);
		
		int replyCnt = gpurchaseReplyFacade.replyCnt(originalReply.getBoardNum());
		Gpurchase gpurchase = gpurchaseFacade.getGpurchaseDetail(originalReply.getBoardNum());
		gpurchase.setReplyCnt(replyCnt);
		
		gpurchaseFacade.gpurchaseReplyCntUpdate(gpurchase);
	}
}
