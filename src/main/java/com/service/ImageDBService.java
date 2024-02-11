package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.ImageDBDao;
import com.Entities.ImageDB;

@Service
public class ImageDBService {

	@Autowired
	private ImageDBDao imageDB; 
	
	public void saveImage(ImageDB image) {
		this.imageDB.saveImage(image);
	}
	
	public List<ImageDB> getAllImages(){
		return this.imageDB.getAllImages();
	}
	
}
