package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Entities.ProductImage;

@Service
public class ProductImageService {

	@Autowired
	ProductImageService productImageService;
	
	public List<ProductImage> getAllProductImage(){
		return this.productImageService.getAllProductImage(); 
	}
	
}
