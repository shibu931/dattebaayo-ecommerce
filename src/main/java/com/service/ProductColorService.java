package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.ProductColorDao;
import com.Entities.ProductColor;

@Service
public class ProductColorService {

	@Autowired
	ProductColorDao productColorDao;
	
	public void createProductColor(ProductColor productColor) {
		this.productColorDao.createProductColor(productColor);
	}
}
