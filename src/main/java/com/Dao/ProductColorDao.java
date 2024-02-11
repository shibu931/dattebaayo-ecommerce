package com.Dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.ProductColor;

@Repository
public class ProductColorDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void createProductColor(ProductColor productColor) {
		this.factory.getCurrentSession().save(productColor);
	}
	
}
