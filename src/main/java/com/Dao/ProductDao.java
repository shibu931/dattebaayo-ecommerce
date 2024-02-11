package com.Dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;

import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Product;

@Repository
public class ProductDao  {

	@Autowired
	private SessionFactory factory;

	@Transactional
	public boolean addProduct(Product product) {
		boolean flag = false;
		try {
			this.factory.getCurrentSession().save(product);
			flag= true;
		} catch (Exception e) {
			System.out.println("There is some error creating product in product Dao ");
		}
		return flag;
	}
	@Transactional
	public List<Product> getAllProducts() {
		List<Product> list = new ArrayList<Product>();
		String q= "select * from product";
		NativeQuery<Product> query = this.factory.getCurrentSession().createNativeQuery(q, Product.class);
		list = query.list();
		return list;
	}

	@Transactional
	public Product getProductById(int id) {
		Product product = this.factory.getCurrentSession().find(Product.class, id);
		System.out.println(product.getSize());
		System.out.println(product.getColor());
		return product;
	}
	
	@Transactional
	public List<Product> getProductByCategory(int category,int pageSize, String sortBy) {
		String orderBy="";
		if(sortBy.equals("price")) {
			orderBy= "ORDER BY p_dis_price ASC";
		}else if(sortBy.equals("popularity")){
			orderBy="ORDER BY popularity DESC";
		}
		String q = "from Product where p_category =:x "+orderBy;
		Query<Product> query = this.factory.getCurrentSession().createQuery(q,Product.class);
		query.setParameter("x", category);
		int firstResult =pageSize*7;
		query.setFirstResult(firstResult);
		query.setMaxResults(8);
		List<Product> product=null;
		try {
			product= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return product;
	}
	
	@Transactional
	public Product getProductByName(String productName,int productId) {
		String q = "from Product where p_name =:x and p_id=:y";
		Query<Product> query = this.factory.getCurrentSession().createQuery(q,Product.class);
		query.setParameter("x", productName);
		query.setParameter("y", productId);
		Product product = query.getSingleResult(); 
		System.out.println(product.getSize());
		System.out.println(product.getColor());
		return product;
	}

	@Transactional
	public List<Product> getLatestProducts (){
		Query<Product> query = this.factory.getCurrentSession().createQuery("FROM Product ORDER BY time DESC",Product.class);
		query.setMaxResults(8);
		List<Product> latestProducts = query.getResultList();
		return latestProducts;
	}
	
	@Transactional
	public List<Product> getTopSellingProducts (){
		Query<Product> query = this.factory.getCurrentSession().createQuery("FROM Product ORDER BY popularity DESC",Product.class);
		query.setMaxResults(8);
		List<Product> latestProducts = query.getResultList();
		return latestProducts;
	}
	
	@Transactional
	public int getRowCount(String columnName,int value) {
		String  q = "select count(*) from Product where "+columnName+" = :value";
		Query<Long> query = this.factory.getCurrentSession().createQuery(q, Long.class);
		query.setParameter("value", value);
		Long rowCount = query.getSingleResult();
		int intValue = rowCount.intValue();
		return intValue;
	}
	
	@Transactional
	public List<Product> getProductByAnime(int anime,int pageSize, String sortBy) {
		String orderBy="";
		if(sortBy.equals("price")) {
			orderBy= "ORDER BY p_dis_price ASC";
		}else if(sortBy.equals("popularity")){
			orderBy="ORDER BY popularity DESC";
		}
		String q = "from Product where p_anime =:x "+orderBy;
		Query<Product> query = this.factory.getCurrentSession().createQuery(q,Product.class);
		query.setParameter("x", anime);
		int startIndex =pageSize*8;
		query.setFirstResult(startIndex);
		query.setMaxResults(8);
		List<Product> product=null;
		try {
			product= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return product;
	}
	@Transactional
	public List<Product> getSearchedProduct(String keyword,int pageSize,String sortBy){
		String orderBy="";
		if(sortBy.equals("price")) {
			orderBy= "ORDER BY p_dis_price ASC";
		}else if(sortBy.equals("popularity")){
			orderBy="ORDER BY popularity DESC";
		}
		String q = "FROM Product WHERE p_name LIKE :query "+orderBy;
	    Query<Product> query = this.factory.getCurrentSession().createQuery(q, Product.class);
	    query.setParameter("query", "%" + keyword + "%");
	    int startIndex =pageSize*8;
		query.setFirstResult(startIndex);
		query.setMaxResults(8);
		List<Product> product=null;
		try {
			product= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
	    return product;
	}
	@Transactional
	public int getSearchedProductRowCount(String value) {
		String q = "select count(*) from Product WHERE p_name LIKE :query";
		Query<Long> query = this.factory.getCurrentSession().createQuery(q, Long.class);
		query.setParameter("query", "%" + value + "%");
		Long rowCount = query.getSingleResult();
		int intValue = rowCount.intValue();
		return intValue;
	}

}
