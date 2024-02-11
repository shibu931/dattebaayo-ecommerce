package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.CouponCodes;

@Repository
public class CouponCodesDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void saveCoupon(CouponCodes couponCodes) {
		this.factory.getCurrentSession().persist(couponCodes);
	}
	
	@Transactional
	public List<CouponCodes> getAllCoupons() {
		List<CouponCodes> list = new ArrayList<CouponCodes>();
		String q= "select * from couponcodes";
		NativeQuery<CouponCodes> query = this.factory.getCurrentSession().createNativeQuery(q, CouponCodes.class);
		list = query.list();
		return list;
	}
	
}
