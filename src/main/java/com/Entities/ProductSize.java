package com.Entities;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "productsize")
public class ProductSize {

	@Id
	@GeneratedValue(generator = "productsize_seq", strategy = GenerationType.AUTO)
	private int size_id;
	private String size;
	@JsonIgnore
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "p_id")
	private Product product;
	public int getSize_id() {
		return size_id;
	}
	public void setSize_id(int size_id) {
		this.size_id = size_id;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public ProductSize(int size_id, String size, Product product) {
		super();
		this.size_id = size_id;
		this.size = size;
		this.product = product;
	}
	public ProductSize() {
		super();
	}
}
