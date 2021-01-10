package com.ssd.petMate.dao.mybatis.mapper;

import java.util.HashMap;
import java.util.List;

import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;

//annotaion이 따로 없음 -> 이는 xml에서 정리가 되어있음
public interface UserMapper {

	  UserList getUserByUserID(String userID);
	  
	  int userCount(String keyword);

	  List<UserList> getAllUser(BoardSearch boardSearch);
	  
	  int countUserByUserID(String userID);
	
	  UserList getUserByUserIDAndPwd(UserList user);
	  
	  String getAthorityByUserID(String userID);
	  
	  void insertUser(UserList user);
	
	  void updateUser(UserList user);
	  
	  void deleteUser(String userID);
	  
	  int isPetsitter(String userID);
}
