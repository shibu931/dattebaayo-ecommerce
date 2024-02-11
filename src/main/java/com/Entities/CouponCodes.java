package com.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="couponcodes")
public class CouponCodes {

	@Id
	@GeneratedValue(generator = "couponcodes_seq", strategy = GenerationType.AUTO)
	private int id;
	private String coupon;
	private int discountPercentage;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public int getDiscountPercentage() {
		return discountPercentage;
	}
	public void setDiscountPercentage(int discountPercentage) {
		this.discountPercentage = discountPercentage;
	}
	public CouponCodes(int id, String coupon, int discountPercentage) {
		super();
		this.id = id;
		this.coupon = coupon;
		this.discountPercentage = discountPercentage;
	}
	public CouponCodes() {
		super();
	}
	
	
	
}
