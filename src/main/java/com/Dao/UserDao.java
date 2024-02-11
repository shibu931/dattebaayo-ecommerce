package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.User;

import org.hibernate.query.Query;
@Repository
public class UserDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public boolean createUser(User user){
		Object save = this.factory.getCurrentSession().save(user);
		System.out.println(save.toString());
		return true;
	}
	
	@Transactional
	public void updatePassword(User user) {
		this.factory.getCurrentSession().merge(user);
	}
	
	@Transactional
	public User findUser(String number) {
		String q = "from User where number =:x ";
		Query<User> query = this.factory.getCurrentSession().createQuery(q,User.class);
		query.setParameter("x", number);
		List<User> user =new ArrayList<User>();
		try {
			user = query.getResultList();
			
		} catch (Exception e) {
			System.out.println(e);
		}
		if(user.size()>0) {
			return user.get(0);
		}
		User u =null;
		return u;
	}
	
}
