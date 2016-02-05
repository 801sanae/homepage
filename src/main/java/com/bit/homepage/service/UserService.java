package com.bit.homepage.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.homepage.domain.User;
import com.bit.homepage.repository.UserDao;

@Service
public class UserService {
	
	@Autowired
	private UserDao userDao;

	public UserService() {
		System.out.println(this.getClass());
	}

	public void join(User user) throws Exception {
		userDao.join(user);
	}

	public User login(User user) throws Exception {
		User Authuser = userDao.get(user.getEmail(), user.getPassword());
		return Authuser;
	}

	public User getUser(String email) {
		User userVo = userDao.get(email);
		return userVo;
	}
	
}
