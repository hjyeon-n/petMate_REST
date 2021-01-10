package com.ssd.petMate.Controller;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import com.ssd.petMate.domain.UserList;

public class SignUpCommand {
	private UserList user;
	private boolean newAccount;
	@NotBlank
	private String userID;
	@NotEmpty 
	@Size(min=6, max=100)
	private String pwd;
	@NotBlank
	private String confirmPwd;
	@Email
	@NotBlank
	private String email;
	private boolean userType;
	
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
	public String getConfirmPwd() {
		return confirmPwd;
	}
	public void setConfirmPwd(String comfirmPwd) {
		this.confirmPwd = comfirmPwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public boolean isUserType() {
		return userType;
	}
	public void setUserType(boolean userType) {
		this.userType = userType;
	}
	public UserList getUser() {
		return user;
	}
	public void setUser(UserList user) {
		this.user = user;
	}
	public boolean isNewAccount() {
		return newAccount;
	}
	public void setNewAccount(boolean newAccount) {
		this.newAccount = newAccount;
	}
	public SignUpCommand(UserList user) {
		this.userID = user.getUserID();
		this.email = user.getEmail();
		this.userType = user.isUserType();
		this.pwd = user.getPwd();
		this.newAccount = false;
	}
	public SignUpCommand() {
		super();
		this.newAccount = true;
	}
	
//	암호와 암호 확인이 일치하는지 검사
	public boolean isSamePwdConfirmPwd() {
		if (pwd == null || confirmPwd == null) {
			return false;
		}
		return pwd.equals(confirmPwd);
	}

//	암호가 null 값을 가지거나 공백을 가지고 있는지 검사
	public boolean hasPassword() {
		return pwd != null && pwd.trim().length() > 0;
	}
}