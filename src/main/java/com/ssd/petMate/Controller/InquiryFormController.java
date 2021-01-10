package com.ssd.petMate.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.service.InquiryFacade;

@Controller
public class InquiryFormController {
	
	@Autowired
	private InquiryFacade inquiryFacade;
	
	@Value("inquiry/inquiryForm")
	private String formViewName;
	
	@Value("redirect:/inquiry")
	private String successViewName;
	
	@ModelAttribute("inquiry")
	public Inquiry formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Inquiry inquiry;
			if (request.getParameter("boardNum") != null) {
				inquiry = inquiryFacade.boardDetail(Integer.valueOf(request.getParameter("boardNum")));
			}
			else {
				inquiry = new Inquiry();
			}
			return inquiry;
		}
		else return new Inquiry();
	}
	
	@PostMapping("/inquiryForm")
	public String inquiryInsert(@Valid @ModelAttribute("inquiry") Inquiry inquiry, BindingResult result, 
	         SessionStatus sessionStatus, HttpServletRequest request) {
	      sessionStatus.setComplete();
	      inquiry.setUserID(request.getSession().getAttribute("userID").toString());
	      
	      if (inquiry.getBoardTitle().length() > 25) {
	    	  result.rejectValue("boardTitle", "long");
	      }	
	 
	      if (result.hasErrors()) {
	         return formViewName;
	      }
	      
	      if (request.getParameter("boardNum") == null) {
	    	  inquiry.setUserID(request.getSession().getAttribute("userID").toString());
	    	  inquiryFacade.insertBoard(inquiry);
	      }
	      else {
	    	  inquiryFacade.updateBoard(inquiry);
	      }
	      
	      return successViewName;
	   }

	@GetMapping("/inquiryForm")
	public String inquiruUpdateForm() {
		return formViewName;
	}
}
