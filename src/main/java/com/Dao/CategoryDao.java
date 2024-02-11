package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Categories;


@Repository
public class CategoryDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void createCategories(Categories cat) {
		this.factory.getCurrentSession().save(cat);
	}
	
	@Transactional
	public List<Categories> getAllCategory() {
		String query ="select * from categories";
		NativeQuery<Categories> sq = this.factory.getCurrentSession().createNativeQuery(query,Categories.class);
		List<Categories> categories = sq.list();
		return categories;
	}
	
	@Transactional
	public Categories getCategoryById(int id) {
		return this.factory.getCurrentSession().find(Categories.class, id);
	}
	
}
