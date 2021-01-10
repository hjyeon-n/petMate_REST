package com.ssd.petMate.Controller;

import javax.validation.constraints.NotEmpty;

public class SignInCommand {
	@NotEmpty 
	private String userID;
	@NotEmpty
	private String pwd;
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
}
