package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.ProductImage;


@Repository
public class ProductImageDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public List<ProductImage> getAllProductImage(){
		List<ProductImage> list = new ArrayList<ProductImage>();
		String q= "select * from proudctimage";
		NativeQuery<ProductImage> query = this.factory.getCurrentSession().createNativeQuery(q, ProductImage.class);
		list = query.list();
		return list;
	}
	
	
}
