package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.CartDao;
import com.Entities.Cart;

@Service
public class CartService {

	@Autowired
	private CartDao cartDao;
	
	public void addToCart(Cart cart) {
		this.cartDao.addToCart(cart);
	}
	
	public List<Cart> getCartObj(int user_id){
		return this.cartDao.getCartObj(user_id);
	}
	
	public void deleteProductFromCart(int cartId) {
		this.cartDao.deleteProductFromCart(cartId);
	}
	
	public void deleteProductFromCartusingUserId(int userId) {
		this.cartDao.deleteProductFromCartusingUserId(userId);
	}
	
	
}
