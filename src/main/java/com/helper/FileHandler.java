package com.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileHandler {

	public List<String> saveImage(CommonsMultipartFile[] file,HttpSession s) {
	List<String> imageName =new ArrayList<String>();
	try {	
		for (int i=0;i<file.length;i++) {
			byte[] data = file[i].getBytes();
			String filePath = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
					+ File.separator + "images" + File.separator + "products" + File.separator + file[i].getOriginalFilename();
			
			FileOutputStream fileout = new FileOutputStream(filePath);
			fileout.write(data);
			fileout.close();
			imageName.add(file[i].getOriginalFilename());
		}
		
	}
	catch (Exception e) {
		e.printStackTrace();
	}
		return imageName;
	}
	
	public List<String> saveThumbnail(CommonsMultipartFile[] file,HttpSession s) {
		List<String> imageName =new ArrayList<String>();
		try {
			for (int i=0;i<file.length;i++) {
				byte[] data = file[i].getBytes();
				String filePath = s.getServletContext().getRealPath("/") + "WEB-INF" + File.separator + "resources"
						+ File.separator + "images" + File.separator + "products" + File.separator + "thumbnails" + File.separator + file[i].getOriginalFilename();
				
				FileOutputStream fileout = new FileOutputStream(filePath);
				fileout.write(data);
				fileout.close();
				imageName.add(file[i].getOriginalFilename());
			}
			
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return imageName;
	}
}
