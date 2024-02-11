package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.CouponCodesDao;
import com.Entities.CouponCodes;

@Service
public class CouponsCodesService {

	@Autowired
	private CouponCodesDao couponCodesDao;
	
	public List<CouponCodes> getAllCouponCodes() {
		return this.couponCodesDao.getAllCoupons();
	}
	
	public void saveCoupon(CouponCodes coupon) {
		this.couponCodesDao.saveCoupon(coupon);
	}
	
}
