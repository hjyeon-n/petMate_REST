package com.ssd.petMate.Controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.Gpurchase;
import com.ssd.petMate.domain.Info;
import com.ssd.petMate.domain.Inquiry;
import com.ssd.petMate.domain.Review;
import com.ssd.petMate.service.BestFacade;

@Controller
public class MainController {	
	
	@Autowired
	private BestFacade bestFacade;
	
	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView main(ModelAndView mv, HttpServletRequest request) {

//		월요일 날짜 구하기
		Date mon = new Date();
        try {
           Calendar cal = Calendar.getInstance();
           cal.set(Calendar.DAY_OF_WEEK, Calendar.MONDAY);
           mon = cal.getTime();
        } catch (Exception e) {
            e.printStackTrace();
        }

//        매주 월요일마다 갱신
        List<Info> weeklyBestInfo = bestFacade.weeklyBestInfo(mon);	
//        매일 갱신
        Info dailyBestInfo = bestFacade.dailyBestInfo();
        
        List<Inquiry> weeklyBestInquiry = bestFacade.weeklyBestInquiry(mon);
        Inquiry dailyBestInquiry = bestFacade.dailyBestInquiry();
        
        List<Review> weeklyBestReview = bestFacade.weeklyBestReview(mon);
        Review dailyBestReview = bestFacade.dailyBestReview();
        
        List<Gpurchase> weeklyBestGpurchase = bestFacade.weeklyBestGpurchase(mon);
        Gpurchase dailyBestGpurchase = bestFacade.dailyBestGpurchase();
                
		mv.addObject("weeklyBestInfo", weeklyBestInfo);
		mv.addObject("weeklyBestInquiry", weeklyBestInquiry);
		mv.addObject("weeklyBestReview", weeklyBestReview);
		mv.addObject("weeklyBestGpurchase", weeklyBestGpurchase);
		mv.addObject("dailyBestInfo", dailyBestInfo);
		mv.addObject("dailyBestInquiry", dailyBestInquiry);
		mv.addObject("dailyBestReview", dailyBestReview);
		mv.addObject("dailyBestGpurchase", dailyBestGpurchase);
		mv.setViewName("index");
		return mv;
	}

//	@RequestMapping(value = "/index", method = { RequestMethod.GET, RequestMethod.POST })
//	public ModelAndView index(ModelAndView mv) {
//		mv.setViewName("index");
//		return mv;
//	}
}