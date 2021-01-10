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

import com.ssd.petMate.domain.Secondhand;
import com.ssd.petMate.service.SecondhandImpl;

@Controller
public class SecondhandFormController {
	@Autowired
	private SecondhandImpl secondhandImpl;
	
	@Value("secondhand/secondhandForm")
	private String formViewName;
	
	@Value("redirect:/secondhand")
	private String successViewName;
	
	@ModelAttribute("secondhand")
	public Secondhand formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Secondhand secondhand;
			if(request.getParameter("boardNum") != null) {
				secondhand = secondhandImpl.getSecondhandDetail(Integer.valueOf(request.getParameter("boardNum")));
			}
			else {
				secondhand = new Secondhand();
			}
			return secondhand;
		}
		else {
			return new Secondhand();
		}
	}
	
	@PostMapping("/secondhandForm")
	public String secondhandInsert(@Valid @ModelAttribute("secondhand") Secondhand secondhand, BindingResult result, HttpServletRequest request) {		

		if (result.hasErrors()) {
			return "secondhand/secondhandForm";
		}
		
		if (request.getParameter("boardNum") == null) {
			secondhand.setUserID(request.getSession().getAttribute("userID").toString());
			secondhandImpl.insertSecondhand(secondhand);
		}
		
		else {
			secondhandImpl.updateSecondhand(secondhand);
		}
		return successViewName;
	}
	
	@GetMapping("/secondhandForm")
	public String gpurchaseForm() {
		return formViewName;
	}
		
}
