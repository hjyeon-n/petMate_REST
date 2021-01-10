package com.ssd.petMate.Controller;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.service.GpurchaseFacade;
import com.ssd.petMate.service.SchedulerFacade;

@Controller
public class GpurchaseFormController {
	@Autowired
	private GpurchaseFacade gpurchaseFacade;
	
	@Autowired
	private SchedulerFacade schedulerFacade;
	
	@Value("Gpurchase/GpurchaseForm")
	private String formViewName;
	
	@Value("redirect:/gpurchase")
	private String successViewName;
	
	@ModelAttribute("gpurchase")
	public Gpurchase formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Gpurchase gpurchase;
			if(request.getParameter("boardNum") != null) {
				gpurchase = gpurchaseFacade.getGpurchaseDetail(Integer.valueOf(request.getParameter("boardNum")));
			}
			else {
				gpurchase = new Gpurchase();
			}
			return gpurchase;
		}
		else {
			return new Gpurchase();
		}
	}
	
	@PostMapping("/gpurchaseForm")
	public String gpurchaseInsert(@Valid @ModelAttribute("gpurchase") Gpurchase gpurchase, 
			BindingResult result, HttpServletRequest request) {				
		if (result.hasErrors()) {
			return "Gpurchase/GpurchaseForm";
		}
		if (request.getParameter("boardNum") == null) {
			gpurchase.setUserID(request.getSession().getAttribute("userID").toString());
			gpurchaseFacade.insertGpurchase(gpurchase);
			DateFormat dateFormat = new SimpleDateFormat ("yyyy-MM-dd HH:mm");
			try {
				String date = gpurchase.getEdate() + " 00:00";
				Date edate = dateFormat.parse(date);
				int boardNum = gpurchase.getBoardNum();
				schedulerFacade.testScheduler(edate, boardNum);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		else {
			gpurchaseFacade.updateGpurchase(gpurchase);
		}
		return successViewName;
	}
	
	@GetMapping("/gpurchaseForm")
	public String gpurchaseForm() {
		return formViewName;
	}
}
