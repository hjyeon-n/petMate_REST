package com.ssd.petMate.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.support.SessionStatus;

import com.ssd.petMate.domain.Info;
import com.ssd.petMate.service.InfoFacade;

@Controller
public class InfoFormController {
	@Autowired
	private InfoFacade infoFacade;
	
	@Value("info/infoForm")
	private String formViewName;
	
	@Value("redirect:/info")
	private String successViewName;
	
	@ModelAttribute("info")
	public Info formBacking(HttpServletRequest request) {
		if (request.getMethod().equalsIgnoreCase("GET")) {
			Info info;
			if (request.getParameter("boardNum") != null) {
				info = infoFacade.boardDetail(Integer.valueOf(request.getParameter("boardNum")));
			}
			else {
				info = new Info();
			}
			return info;
		}
		else return new Info();
	}

	@ApiOperation(value = "정보게시판 게시글 수정")
	@PostMapping("/info/post")
	public String infoInsert(@Valid @ModelAttribute("info") Info info, BindingResult result, SessionStatus sessionStatus, HttpServletRequest request) {		
		//게시글 제목 길이
		if (info.getBoardTitle().length() > 25) {
			result.rejectValue("boardTitle", "long");
		}
		
		ValidationUtils.rejectIfEmptyOrWhitespace(result, "boardTitle", "blank");
		ValidationUtils.rejectIfEmptyOrWhitespace(result, "boardContent", "blank");
		
		if (result.hasErrors()) {
			return "info/infoForm";
		}
		
		if (request.getParameter("boardNum") == null) {
			info.setUserID(request.getSession().getAttribute("userID").toString());
			infoFacade.insertBoard(info);
		}
		
		else {
			infoFacade.updateBoard(info);
		}
		return successViewName;
	}

	@ApiOperation(value = "매칭게시판 게시글 작성")
	@GetMapping("/info/post")
	public String infoForm() {
		return formViewName;
	}
}
