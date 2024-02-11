package com.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "cart")
public class Cart {

	@Id
	@GeneratedValue(generator = "cart_seq", strategy = GenerationType.AUTO)
	private int Cart_id;
	private int product_id;
	private int user_id;
	private String size;
	private String color;
	private int quantity;
	
	public int getCart_id() {
		return Cart_id;
	}
	public void setCart_id(int cart_id) {
		Cart_id = cart_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
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
	public Cart() {
		super();
	}
	public Cart(int cart_id, int product_id, int user_id, String size, String color, int quantity ) {
		super();
		Cart_id = cart_id;
		this.product_id = product_id;
		this.user_id = user_id;
		this.size = size;
		this.color = color;
		this.quantity = quantity;
	}
	
}
