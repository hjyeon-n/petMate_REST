package com.ssd.petMate.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SignOutController { 
	@GetMapping("/sign-out")
	public String signOut(HttpServletRequest request) throws Exception {
		HttpSession httpSession = request.getSession();
		httpSession.removeAttribute("userID");
		httpSession.invalidate();
		return "redirect:index";
	}
}