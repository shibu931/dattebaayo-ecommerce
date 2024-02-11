package com.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.ProductDao;
import com.Entities.Product;

@Service
public class ProductService {

	@Autowired
	private ProductDao productDao;
	
	public boolean addProduct(Product product) {
		 return this.productDao.addProduct(product);
	}
	
	public List<Product> getAllProduct(){
		List<Product> list = this.productDao.getAllProducts();
		return list;
	}
	
	public Product getProductById(int id) {
		Product product = this.productDao.getProductById(id);
		return product;
	}
	
	public Product getProductByName(String productName, int productId) {
		return this.productDao.getProductByName(productName,productId);
	}
	
	public List<Product> getProductByAnime(int animeId,int page, String sortBy){
		return this.productDao.getProductByAnime(animeId, page, sortBy);
	}
	
	public List<Product> getLatestProducts(){
		return this.productDao.getLatestProducts();
	}
	
	public List<Product> getTopSellingProducts (){
		return this.productDao.getTopSellingProducts();
	}
	public int getRowCount(String columnName,int value) {
		return this.productDao.getRowCount(columnName, value);
	}
	public List<Product> getProductsByCategory(int category,int pageSize, String sortBy){
		return this.productDao.getProductByCategory(category, pageSize, sortBy);
	}
	
	public List<Product> getSearchedProduct(String keyword,int pageSize,String sortBy ){
		return this.productDao.getSearchedProduct(keyword,pageSize,sortBy);
	}
	public int getSearchedProductRowCount(String value) {
		return this.productDao.getSearchedProductRowCount(value);
	}
	
}
