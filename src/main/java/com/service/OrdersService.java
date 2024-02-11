package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.OrdersDao;
import com.Entities.Orders;

@Service
public class OrdersService {

	@Autowired
	private OrdersDao ordersDao;
	
	public void createOrder(Orders orders ) {
		this.ordersDao.createOrder(orders);
	}
	
	public List<Orders> getOrders(int user_id){
		return this.ordersDao.getOrders(user_id);
	}
	
	public boolean getCouponStatus(String coupon,int userId) {
		return this.ordersDao.getCouponStatus(coupon, userId);
	}
	
}
