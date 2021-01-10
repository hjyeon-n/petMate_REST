package com.ssd.petMate.dao;

import java.util.List;

import org.springframework.dao.DataAccessException;

import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;

public interface UserDao {
	public UserList getUserByUserIDAndPwd(UserList user) throws DataAccessException;
	public void insertUser(UserList user) throws DataAccessException;
	public int countUserByUserID(String userID) throws DataAccessException;
	public UserList getUserByUserID(String userID) throws DataAccessException;
	public String getAthorityByUserID(String userID) throws DataAccessException;
	public void updateUser(UserList user) throws DataAccessException;
	public void deleteUser(String userID) throws DataAccessException;
	public int isPetsitter(String userID) throws DataAccessException;
	public int userCount(String keyword) throws DataAccessException;
	public List<UserList> getAllUser(BoardSearch boardSearch) throws DataAccessException;
}
