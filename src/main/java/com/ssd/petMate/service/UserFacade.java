package com.ssd.petMate.service;

import java.util.List;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;

public interface UserFacade extends UserDetailsService{
	int countUserByUserID(String userID);
	UserList getUserByUserID(String userID);
	UserList getUserByUserIDAndPwd(UserList user);
	String getAthorityByUserID(String userID);
	void insertUser(UserList user);
	void updateUser(UserList user);
	void deleteUser(String userID);
	UserDetails loadUserByUsername(String username);
	int isPetsitter(String userID);
	int userCount(String keyword);
	List<UserList> getAllUser(BoardSearch boardSearch);
}
