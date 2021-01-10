package com.ssd.petMate.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.ssd.petMate.Controller.SignUpCommand;
import com.ssd.petMate.dao.UserDao;
import com.ssd.petMate.domain.UserList;
import com.ssd.petMate.page.BoardSearch;

@Service
@Transactional
public class UserImpl implements UserFacade {
	
	@Autowired
	private UserDao userDao;
	
	public UserList getUserByUserID(String userID) {
		return userDao.getUserByUserID(userID);
	}
	
	public int countUserByUserID(String userID) {
		return userDao.countUserByUserID(userID);
	}
	
	public UserList getUserByUserIDAndPwd(UserList user) {
		return userDao.getUserByUserIDAndPwd(user);
	}
	
	public String getAthorityByUserID(String userID) {
		return userDao.getAthorityByUserID(userID);
	}
	
	public void insertUser(UserList user) {
		userDao.insertUser(user);
	}
	
	public void updateUser(UserList user) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPwd((passwordEncoder.encode(user.getPwd())));
		userDao.updateUser(user);
	}
	
	public void deleteUser(String userID) {
		userDao.deleteUser(userID);
	}

	@Override
	public UserDetails loadUserByUsername(String userID) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		 //사용자 아이디 확인
        UserList user= userDao.getUserByUserID(userID);//파라미터로 넘어온 값 mapper로 전달
       
        
        //아이디가 없으면 예외 발생시키기 (throw)
        if(user == null) {
        	throw new UsernameNotFoundException(userID);
        }
            
        //권한설정 목록
        List<GrantedAuthority> authority=new ArrayList<GrantedAuthority>();
        authority.add(new SimpleGrantedAuthority(user.getAuthority())); 
        
        return new User(user.getUserID(), user.getPwd(), authority);
	}

	@Transactional
	public void joinUser(UserList user) {
		// 비밀번호 암호화
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		user.setPwd((passwordEncoder.encode(user.getPwd())));
		userDao.insertUser(user);
	}
	
	public UserList regComToUser (SignUpCommand  regReq) {
		UserList user = new UserList(regReq.getUserID(), 
							regReq.getPwd(), 
							regReq.getEmail(),
							regReq.isUserType(),
							"ROLE_USER");
		return user;
	}

	@Override
	public int isPetsitter(String userID) {
		return userDao.isPetsitter(userID);
	}

	@Override
	public int userCount(String keyword) {
		// TODO Auto-generated method stub
		return userDao.userCount(keyword);
	}

	@Override
	public List<UserList> getAllUser(BoardSearch boardSearch) {
		// TODO Auto-generated method stub
		return userDao.getAllUser(boardSearch);
	}
}