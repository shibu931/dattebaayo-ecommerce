package com.Entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="orders")
public class Orders {

	@Id
	@GeneratedValue(generator = "orders_seq", strategy = GenerationType.AUTO)
	private int id;
	private String orderId; 
	private int user_id;
	private String name;
	private String email;
	private String number;
	private String houseNo;
	private String streetNo;
	private String locality;
	private String city;
	private String state;
	private String pincode;
	private int product_id;
	private String size;
	private String color;
	private int quantity;
	private String paymentMode;
	@CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdTime;
	@Column(columnDefinition = "VARCHAR(100) DEFAULT 'In Progress'")
	private String status;
	private String coupon;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getHouseNo() {
		return houseNo;
	}
	public void setHouseNo(String houseNo) {
		this.houseNo = houseNo;
	}
	public String getStreetNo() {
		return streetNo;
	}
	public void setStreetNo(String streetNo) {
		this.streetNo = streetNo;
	}
	public String getLocality() {
		return locality;
	}
	public void setLocality(String locality) {
		this.locality = locality;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public Date getCreatedTime() {
		return createdTime;
	}
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getOrderId() {
		return orderId;
	}
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}
	public String getCoupon() {
		return coupon;
	}
	public void setCoupon(String coupon) {
		this.coupon = coupon;
	}
	public Orders(int id, String orderId, int user_id, String name, String email, String number, String houseNo,
			String streetNo, String locality, String city, String state, String pincode, int product_id, String size,
			String color, int quantity, String paymentMode,Date createdTime, String status, String coupon) {
		super();
		this.id = id;
		this.orderId = orderId;
		this.user_id = user_id;
		this.name = name;
		this.email = email;
		this.number = number;
		this.houseNo = houseNo;
		this.streetNo = streetNo;
		this.locality = locality;
		this.city = city;
		this.state = state;
		this.pincode = pincode;
		this.product_id = product_id;
		this.size = size;
		this.color = color;
		this.quantity = quantity;
		this.paymentMode = paymentMode;
		this.createdTime = createdTime;
		this.status = status;
		this.coupon = coupon;
	}
	public Orders() {
		super();
	
	}
	
}
