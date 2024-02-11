package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Orders;

import org.hibernate.query.*;

@Repository
public class OrdersDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void createOrder(Orders order) {
		this.factory.getCurrentSession().save(order);
	}
	
	@Transactional
	public List<Orders> getOrders(int user_id){
		String q = "from Orders where user_id =:x ";
		Query<Orders> query = this.factory.getCurrentSession().createQuery(q,Orders.class);
		query.setParameter("x", user_id);
		List<Orders> order=null;
		try {
			order= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return order;
	}
	
	@Transactional
	public boolean getCouponStatus(String coupon,int userId) {
		String q = "select coupon from orders where user_id=:x";
		NativeQuery<Orders> query = this.factory.getCurrentSession().createNativeQuery(q, Orders.class);
		query.setParameter("x", userId);
		List<Orders> order =null;
		try {
			order= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		if(order!=null) {
			for (Orders orders : order) {
				if(orders.getCoupon().equals(coupon)) {
					return false;
				}
			}
		}
		return true;
	}
	
}
