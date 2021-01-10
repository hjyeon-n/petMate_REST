package com.ssd.petMate.domain;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class UserList implements UserDetails{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String userID;
	private String pwd;
	private String email;
	private boolean userType;
	private String authority;
	
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
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return false;
	}
	public UserList(String userID, String pwd, String email, boolean userType, String authority) {
		super();
		this.userID = userID;
		this.pwd = pwd;
		this.email = email;
		this.userType = userType;
		this.authority = authority;
	}

	public UserList() {
		super();
	}
	@Override
	public String toString() {
		return "UserList [userID=" + userID + ", pwd=" + pwd + ", email=" + email + ", userType=" + userType
				+ ", authority=" + authority + "]";
	}
}