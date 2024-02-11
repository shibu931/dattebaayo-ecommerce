package com.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="productcolor")
public class ProductColor {

	@Id
	@GeneratedValue(generator = "productcolor_seq", strategy = GenerationType.AUTO)
	private int id;
	private String color;
	@JsonIgnore
	@ManyToOne
	@JoinColumn(name="p_id")
	private Product product;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ProductColor(int id, String color, Product product) {
		super();
		this.id = id;
		this.color = color;
		this.product = product;
	}
	public ProductColor() {
		super();
	}
}
