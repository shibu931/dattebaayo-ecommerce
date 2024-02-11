package com.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "productimage")
public class ProductImage {

	@Id
	@GeneratedValue(generator = "productimage_seq", strategy = GenerationType.AUTO)
	private int img_id;
	@JsonIgnore
	@OneToOne
	@JoinColumn(name="p_id")
	private Product product;
	private String image;
	private String image1;
	private String image2;
	private String image3;
	
	public int getImg_id() {
		return img_id;
	}

	public void setImg_id(int img_id) {
		this.img_id = img_id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getImage1() {
		return image1;
	}

	public void setImage1(String image1) {
		this.image1 = image1;
	}

	public String getImage2() {
		return image2;
	}

	public void setImage2(String image2) {
		this.image2 = image2;
	}

	public String getImage3() {
		return image3;
	}

	public void setImage3(String image3) {
		this.image3 = image3;
	}
	
	public ProductImage(int img_id, Product product, String image, String image1, String image2, String image3) {
		super();
		this.img_id = img_id;
		this.product = product;
		this.image = image;
		this.image1 = image1;
		this.image2 = image2;
		this.image3 = image3;
	}

	public ProductImage() {
		super();
	}
	
}
