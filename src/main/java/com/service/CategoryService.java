package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.CategoryDao;
import com.Entities.Categories;

@Service
public class CategoryService {

	@Autowired
	CategoryDao categoryDao;
	
	public void createCategory(Categories cat) {
		this.categoryDao.createCategories(cat);
	}
	
	public List<Categories> getAllCategories(){
		List<Categories> list = this.categoryDao.getAllCategory();
		return list;
	}
	
	public Categories getCategoryById(int id) {
		return this.categoryDao.getCategoryById(id);
	}
	
}
