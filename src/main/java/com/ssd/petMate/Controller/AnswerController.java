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

import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Answer;
import com.ssd.petMate.service.InquiryFacade;
import com.ssd.petMate.service.AnswerFacade;

@Controller
public class AnswerController {

	@Autowired
	private AnswerFacade answerFacade;
	
	@Autowired
	private InquiryFacade inquiryFacade;
	
//	게시글 상세보기를 클릭했을 때 답변 리스트 가져오기
	@RequestMapping(value = "/answerList", method = { RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public List<Answer> answerList(ModelAndView mv,
			@RequestParam("boardNum") int boardNum) {
		List<Answer> answerList = answerFacade.getAnswerList(boardNum);
		return answerList;
	}	
	
//	답변 입력하기
	@RequestMapping(value = "/insertAnswer", method = RequestMethod.POST)
	@ResponseBody
	public void insertAnswer(ModelAndView mv, HttpServletRequest request,
			@ModelAttribute("infoReply") Answer answer) {
		String userID = (String) request.getSession().getAttribute("userID");
		answer.setUserID(userID);
//		답변 삽입
		answerFacade.insertAnswer(answer);
//		게시글 목록에서 답변 수 확인이 가능하도록 하기 위해 지정
		int answerCnt = answerFacade.answerCnt(answer.getBoardNum());
		Inquiry inquiry = inquiryFacade.boardDetail(answer.getBoardNum());
		inquiry.setAnswerCnt(answerCnt);
		
		inquiryFacade.updateReplyCnt(inquiry);
	}
	
//	답변 수정
	@RequestMapping(value= "/updateAnswer", method = RequestMethod.POST) 
    @ResponseBody
    public void updateInfoReply(ModelAndView mv,
    		@RequestParam("answerNum") int answerNum,
			@RequestParam("answerContent") String replyContent) throws Exception{
		Answer answer = new Answer();
		answer.setAnswerNum(answerNum);
		answer.setAnswerContent(replyContent);

		answerFacade.updateAnswer(answer);
    }
	
//	답변 삭제
	@RequestMapping(value = "/deleteAnswer", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void deleteAnswer(ModelAndView mv, HttpServletRequest request,
			@RequestParam("answerNum") int answerNum,
			@RequestParam("boardNum") int boardNum) {
		
		answerFacade.deleteAnswer(answerNum); // 실제 답변 없애기 -> 만약 답글이 달린 글이면 답글까지 전부 삭제
		
//		갱신 연산이 이루어진 후의 cnt
		int replyCnt = answerFacade.answerCnt(boardNum);
		Inquiry inquiry = inquiryFacade.boardDetail(boardNum);
		inquiry.setAnswerCnt(replyCnt);
//		댓글 수 업데이트
		inquiryFacade.updateReplyCnt(inquiry);
	}
	
//	답변 채택
	@RequestMapping(value = "/selectAnswer", method = { RequestMethod.GET, RequestMethod.POST })
	@ResponseBody
	public void selectAnswer(ModelAndView mv, HttpServletRequest request,
			@RequestParam("boardNum") int boardNum,
			@RequestParam("answerNum") int answerNum)	{
		inquiryFacade.selectInquiry(boardNum); 
		answerFacade.selectAnswer(answerNum);
	}
	
	@RequestMapping(value = "/answerReply", method = RequestMethod.POST)
	@ResponseBody
	public void answerComment(ModelAndView mv, HttpServletRequest request,
			@RequestParam("answerNum") int answerNum,
			@RequestParam("answerContent") String answerContent) {
			
		String userID = (String) request.getSession().getAttribute("userID");

//		답글을 달 부모 답변
		Answer answer = answerFacade.answerDetail(answerNum);
		
//		답글의 객체
		Answer answerReply = new Answer();
		
//		답글의 GID는 부모 답변의 ID
		answerReply.setReplyParents(answerNum);

//		답변과 답글의 정렬을 위해 지정
		HashMap<String, Object> map = new HashMap<String, Object>();
//		이 부분 수정했음
		map.put("replyGID", answerNum);
		map.put("replyOrder", answer.getReplyOrder());
		answerFacade.setAnswerOrder(map);
		
		answerReply.setAnswerContent(answerContent);
		answerReply.setReplyOrder(answer.getReplyOrder() + 1);
		answerReply.setReplyGID(answerNum);
		answerReply.setUserID(userID);
		answerReply.setBoardNum(answer.getBoardNum());
		
		answerFacade.insertAnswer(answerReply);
		
//		답글 수 증가
		int replyCnt = answerFacade.answerCnt(answer.getBoardNum());
		Inquiry inquiry = inquiryFacade.boardDetail(answer.getBoardNum());
		inquiry.setAnswerCnt(replyCnt);
		
		inquiryFacade.updateReplyCnt(inquiry);
	}
}
