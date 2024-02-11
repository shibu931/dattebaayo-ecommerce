package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.UserDao;
import com.Entities.User;

@Service
public class UserService {

	@Autowired
	UserDao userDao;
	
	public boolean createUser(User user) {
		return this.userDao.createUser(user);
	}
	public User findUser(String number) {
		return this.userDao.findUser(number);
	}
	public void updatePassword(User user) {
		this.userDao.updatePassword(user);
	}
}
