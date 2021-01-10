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
import com.ssd.petMate.domain.ReviewReply;
import com.ssd.petMate.service.ReviewFacade;
import com.ssd.petMate.service.ReviewReplyFacade;

@Controller
public class ReviewReplyController {

	@Autowired
	private ReviewReplyFacade reviewReplyFacade;
	
	@Autowired
	private ReviewFacade reviewFacade;
	
//	게시글 상세보기를 클릭했을 때 댓글 리스트 가져오기
	@RequestMapping(value = "/reviewReplyList", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<ReviewReply> reviewReplyList(ModelAndView mv,
			@RequestParam("boardNum") int boardNum) {
		List<ReviewReply> replyList = reviewReplyFacade.getReplyList(boardNum);
		return replyList;
	}	
	
//	댓글 입력하기
	@RequestMapping(value = "/insertReviewReply", method = RequestMethod.POST)
	@ResponseBody
	public void insertReviewReply(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("reviewReply") ReviewReply reviewReply) {
		String userID = (String) request.getSession().getAttribute("userID");
		reviewReply.setUserID(userID);
//		댓글 삽입
		reviewReplyFacade.insertReply(reviewReply);
//		게시글 목록에서 댓글 수 확인이 가능하도록 하기 위해 지정
		
		int replyCnt = reviewReplyFacade.replyCnt(reviewReply.getBoardNum());
		Review review = reviewFacade.boardDetail(reviewReply.getBoardNum());
		review.setReplyCnt(replyCnt);
		
		reviewFacade.updateReplyCnt(review);
	}
	
//	댓글 수정
	@RequestMapping(value= "/updateReviewReply", method = RequestMethod.POST) 
    @ResponseBody
    public void updateReviewReply(ModelAndView mv,
    		@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) throws Exception{
        
		ReviewReply reply = new ReviewReply();
		reply.setReplyNum(replyNum);
		reply.setReplyContent(replyContent);

		reviewReplyFacade.updateReply(reply);
    }
	
//	댓글 삭제
	@RequestMapping(value = "/deleteReviewReply", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void deleteReviewReply(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("boardNum") int boardNum) {
		
		reviewReplyFacade.deleteReply(replyNum); // 실제 댓글 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
		int replyCnt = reviewReplyFacade.replyCnt(boardNum);
		Review review = reviewFacade.boardDetail(boardNum);
		review.setReplyCnt(replyCnt);
		reviewFacade.updateReplyCnt(review);
	}
	
	@RequestMapping(value = "/reviewReReply", method = RequestMethod.POST)
	@ResponseBody
	public void reviewReplyComment(ModelAndView mv, HttpServletRequest request,
			@RequestParam("replyNum") int replyNum,
			@RequestParam("replyContent") String replyContent) {
		
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모  댓글
		ReviewReply originalReply = reviewReplyFacade.replyDetail(replyNum);
		
//		답글의 객체
		ReviewReply reReply = new ReviewReply();
		
//		답글의 GID는 부모 댓글의 ID
		reReply.setReplyParents(replyNum);

//		댓글과 답글의 정렬을 위해 지정
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("replyGID", reReply.getReplyGID());
		map.put("replyOrder", originalReply.getReplyOrder());
		reviewReplyFacade.setReplyOrder(map);
		
		reReply.setReplyContent(replyContent);
		reReply.setReplyOrder(originalReply.getReplyOrder() + 1);
		reReply.setReplyGID(replyNum);
		reReply.setUserID(userID);
		reReply.setBoardNum(originalReply.getBoardNum());
		
		reviewReplyFacade.insertReply(reReply);
		
		int replyCnt = reviewReplyFacade.replyCnt(originalReply.getBoardNum());
		Review review = reviewFacade.boardDetail(originalReply.getBoardNum());
		review.setReplyCnt(replyCnt);
		
		reviewFacade.updateReplyCnt(review);
	}
}
