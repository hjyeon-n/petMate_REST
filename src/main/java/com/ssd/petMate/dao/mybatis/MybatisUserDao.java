package com.ssd.petMate.dao.mybatis;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.ssd.petMate.dao.UserDao;
import com.ssd.petMate.dao.mybatis.mapper.UserMapper;
import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;

@Repository
public class MybatisUserDao implements UserDao {

	@Autowired
	private UserMapper userMapper;
	
	public UserList getUserByUserID(String userID) {
		return userMapper.getUserByUserID(userID);
	}
	
	public int countUserByUserID(String userID) {
		return userMapper.countUserByUserID(userID);
	}

	public UserList getUserByUserIDAndPwd(UserList user) {
		return userMapper.getUserByUserIDAndPwd(user);
	}
	
	public String getAthorityByUserID(String userID) {
		return userMapper.getAthorityByUserID(userID);
	}
	  
	public void insertUser(UserList user) {
		userMapper.insertUser(user);
	}

	public void updateUser(UserList user) {
		userMapper.updateUser(user);
	}
	  
	public void deleteUser(String userID) {
		userMapper.deleteUser(userID);
	}

	@Override
	public int isPetsitter(String userID) throws DataAccessException {
		return userMapper.isPetsitter(userID);
	}

	@Override
	public int userCount(String keyword) throws DataAccessException {
		// TODO Auto-generated method stub
		return userMapper.userCount(keyword);
	}

	@Override
	public List<UserList> getAllUser(BoardSearch boardSearch) throws DataAccessException {
		// TODO Auto-generated method stub
		return userMapper.getAllUser(boardSearch);
	}
}
