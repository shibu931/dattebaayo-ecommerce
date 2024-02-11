package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.ImageDB;

@Repository
public class ImageDBDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void saveImage(ImageDB image) {
		this.factory.getCurrentSession().save(image);
	}
	
	@Transactional
	public List<ImageDB> getAllImages(){
		String query = "select * from ImageDB";
		NativeQuery<ImageDB> sq = this.factory.getCurrentSession().createNativeQuery(query,ImageDB.class);
		List<ImageDB> list = sq.list();
		return list;
	}
	
}
