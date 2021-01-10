package com.ssd.petMate.Controller;

import java.util.ArrayList;
import java.util.List;

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

import com.ssd.petMate.domain.Code;
import com.ssd.petMate.domain.Petsitter;
import com.ssd.petMate.service.PetsitterFacade;
import com.ssd.petMate.service.UserImpl;
import com.ssd.petMate.validator.PetsitterValidator;

@Controller
public class PetsitterFormController {
	@Value("#{file['appkey']}")
	String appkey;
	
	@Autowired
	private PetsitterFacade petsitterFacade;
	
	@Autowired
	private UserImpl userService;
	
	@Value("petsitter/petsitterForm")
	private String formViewName;
	
	@Value("redirect:/petsitterList")
	private String successViewName;
	
	@ModelAttribute("appkey")
	public String formBacking1(HttpServletRequest request) {
		return appkey;
	}
	
	@ModelAttribute("petsitter")
	public Petsitter formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Petsitter petsitter;
			if (request.getParameter("boardNum") != null) {
				System.out.println(request.getParameter("boardNum"));
				petsitter = petsitterFacade.boardDetail(Integer.valueOf(request.getParameter("boardNum")));
			}
			else {
				petsitter = new Petsitter();
			}
			return petsitter;
		}
		else return new Petsitter();
	}
	
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
	
	@ModelAttribute("petsitterChk")
	public int petsitterChk(HttpServletRequest request) {
		if (request.getSession().getAttribute("userID") != null) {
			return userService.isPetsitter(request.getSession().getAttribute("userID").toString());
		}
		return -1;
	}

	@PostMapping("/petsitterForm")
	public String petsitterInsert(@Valid @ModelAttribute("petsitter") Petsitter petsitter, BindingResult result, 
	         SessionStatus sessionStatus, HttpServletRequest request) {
	      int sizeSum = 0;
	      int daySum = 0;
	      petsitter.setUserID(request.getSession().getAttribute("userID").toString());
	      
	      for (String s : petsitter.getSizeCodes()) {
	         sizeSum += Integer.parseInt(s);
	      }
	      petsitter.setPetSize(Integer.toString(sizeSum));
	      
	      for (String s : petsitter.getDayCodes()) {
	         daySum += Integer.parseInt(s);
	      }
	      petsitter.setPetDay(Integer.toString(daySum));

	      new PetsitterValidator().validate(petsitter, result);
	      
	      if (result.hasErrors()) {
	    	  return formViewName;
	      }
	      
	      if (request.getParameter("boardNum") == null) {
	    	  petsitter.setUserID(request.getSession().getAttribute("userID").toString());
	    	  petsitterFacade.insertBoard(petsitter);
	      }
	      else {
	    	  petsitterFacade.updateBoard(petsitter);
	      }
	      //mv.setViewName("petsitter/petsitterList");
	      return successViewName;
	   }

	@GetMapping("/petsitterForm")
	public String petsitterUpdateForm() {
		return formViewName;
	}
}
