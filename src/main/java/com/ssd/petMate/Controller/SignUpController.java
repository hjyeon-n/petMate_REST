package com.ssd.petMate.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.service.UserImpl;

@Controller
public class SignUpController {

	@Value("user/signUpForm")
	private String formViewName;
	@Value("index")
	private String successViewName;
	
	@Autowired
	private UserImpl userService;
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@ModelAttribute("registerForm")
	public SignUpCommand formBackingObject(HttpServletRequest request) throws Exception {
		if (request.getSession().getAttribute("userID") != null) {	// edit an existing account
			String userID = (String)request.getSession().getAttribute("userID");
			return new SignUpCommand(userService.getUserByUserID(userID));
		}
		else {	// create a new account
			return new SignUpCommand();
		}
	}
	
	@GetMapping("/sign-up")
	public String showForm() {
		return formViewName;
	}
	
	@GetMapping(value = "/checkID/{userID}")
	@ResponseBody
	public int checkID(ModelAndView mv, @PathVariable("userID") String userID) {
		return userService.countUserByUserID(userID);
	}
	
	@PostMapping("/sign-up")
	public String onSubmit(
			HttpServletRequest request, @Valid @ModelAttribute("registerForm") SignUpCommand regCommand,
			BindingResult result, Model model) throws Exception {

		if (result.hasErrors()) return formViewName;
		
		if (!regCommand.isSamePwdConfirmPwd()) {
			result.rejectValue("confirmPwd", "notSame");
			return formViewName;
		}
		
		try {
//			회원가입
			UserList user = userService.regComToUser(regCommand);

			if (request.getSession().getAttribute("userID") == null) {
				userService.joinUser(user);
			}
//			회원정보 수정
			else {
				userService.updateUser(user);
			}
		}
		catch (DataIntegrityViolationException ex) {
			result.rejectValue("userID", "USER_ID_ALREADY_EXISTS",
					"이미 존재하는 아이디입니다");
			return formViewName; 
		}
		return successViewName;  
	}
	
//	패스워드 확인 후 회원정보 수정 가능
	@PostMapping(value = "/confirm/{pwd}")
	@ResponseBody
	public int myPageModify(HttpServletRequest request,
			@PathVariable("pwd") String confirmPwd) {
		String userID = (String)request.getSession().getAttribute("userID");
		UserDetails user = userService.loadUserByUsername(userID);
		if(passwordEncoder.matches(confirmPwd, user.getPassword())) {
			return 1;
		} 
		return 0;
	}
}