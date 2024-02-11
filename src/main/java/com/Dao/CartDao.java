package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Cart;

import org.hibernate.query.Query;

@Repository
public class CartDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void addToCart(Cart cart) {
		this.factory.getCurrentSession().save(cart);
	}

	@Transactional
	public List<Cart> getCartObj(int user_id){
		String q = "from Cart where user_id =:x ";
		Query<Cart> query = this.factory.getCurrentSession().createQuery(q,Cart.class);
		query.setParameter("x", user_id);
		List<Cart> cart =null;
		try {
			cart = query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return cart;
	}

	@Transactional
	public void deleteProductFromCart(int cartId) {
		String q = "delete from Cart where Cart_id=:x";
		@SuppressWarnings("rawtypes")
		Query query = this.factory.getCurrentSession().createQuery(q); 
		query.setParameter("x",cartId);
		int r = query.executeUpdate();
		System.out.println(r);
	}
	
	@Transactional
	public void deleteProductFromCartusingUserId(int userId) {
		String q = "delete from Cart where user_id=:x";
		@SuppressWarnings("rawtypes")
		Query query = this.factory.getCurrentSession().createQuery(q); 
		query.setParameter("x",userId);
		int r = query.executeUpdate();
		System.out.println(r);
	}
	
}
