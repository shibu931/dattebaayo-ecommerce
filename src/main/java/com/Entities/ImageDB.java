package com.Entities;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class ImageDB {

	@Id
	@GeneratedValue(generator = "image_seq",strategy = GenerationType.AUTO)
	private int id;
	private String imageName;
	@Lob
	private byte[] image;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getImageName() {
		return imageName;
	}
	public void setImageName(String imageName) {
		this.imageName = imageName;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public ImageDB(int id, String imageName, byte[] image) {
		super();
		this.id = id;
		this.imageName = imageName;
		this.image = image;
	}
	public ImageDB() {
		super();
	}
	
}
