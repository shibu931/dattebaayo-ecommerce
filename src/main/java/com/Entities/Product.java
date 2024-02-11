package com.Entities;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="product")
public class Product {

	@Id
	@GeneratedValue(generator = "product_seq", strategy = GenerationType.AUTO)
	private int p_id;
	private String p_name;
	private int p_price;
	private int p_dis_price;
	private int p_anime;
	private int p_character;
	private int p_category;
	private int popularity;
	@CreationTimestamp
    @Temporal(TemporalType.TIMESTAMP)
	private Date time;
	@OneToOne(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.EAGER)
	private ProductImage images;
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
	private List<ProductSize> size;
	@JsonIgnore
	@OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true,fetch = FetchType.LAZY)
	private List<ProductColor> color;
	
	public int getP_id() {
		return p_id;
	}
	public void setP_id(int p_id) {
		this.p_id = p_id;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_dis_price() {
		return p_dis_price;
	}
	public void setP_dis_price(int p_dis_price) {
		this.p_dis_price = p_dis_price;
	}
	public ProductImage getImages() {
		return images;
	}
	public void setImages(ProductImage images) {
		this.images = images;
	}
	public List<ProductSize> getSize() {
		return size;
	}
	public void setSize(List<ProductSize> size) {
		this.size = size;
	}
	public List<ProductColor> getColor() {
		return color;
	}
	public void setColor(List<ProductColor> color) {
		this.color = color;
	}
	public int getP_anime() {
		return p_anime;
	}
	public void setP_anime(int p_anime) {
		this.p_anime = p_anime;
	}
	public int getP_character() {
		return p_character;
	}
	public void setP_character(int p_character) {
		this.p_character = p_character;
	}
	public int getP_category() {
		return p_category;
	}
	public void setP_category(int p_category) {
		this.p_category = p_category;
	}
	public int getSoldItem() {
		return popularity;
	}
	public void setSoldItem(int soldItem) {
		this.popularity = soldItem;
	}
	public Product(int p_id, String p_name, int p_price, int p_dis_price, int p_anime, int p_character, int p_category,
			int soldItem, Date time, ProductImage images, List<ProductSize> size, List<ProductColor> color) {
		super();
		this.p_id = p_id;
		this.p_name = p_name;
		this.p_price = p_price;
		this.p_dis_price = p_dis_price;
		this.p_anime = p_anime;
		this.p_character = p_character;
		this.p_category = p_category;
		this.popularity = soldItem;
		this.time = time;
		this.images = images;
		this.size = size;
		this.color = color;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Product() {
		super();
	}
	@Override
	public String toString() {
		return "Product [p_id=" + p_id + ", p_name=" + p_name + ", p_price=" + p_price + ", p_dis_price=" + p_dis_price
				+ ", p_anime=" + p_anime + ", p_character=" + p_character + ", p_category=" + p_category + ", soldItem="
				+ popularity + ", time=" + time + ", images=" + images + ", size=" + size + ", color=" + color + "]";
	}
	
	
	
}
