package com.Entities;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="user")
public class User {

	@Id
	@GeneratedValue(generator = "user_seq", strategy = GenerationType.AUTO)
	private int User_id;
	private String name;
	@Column(unique=true)
	private String number;
	private String email;
	private String password;
	private String rPassowrd;
	public int getUser_id() {
		return User_id;
	}
	public void setUser_id(int user_id) {
		User_id = user_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNumber() {
		return number;
	}
	public void setNumber(String number) {
		this.number = number;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getrPassowrd() {
		return rPassowrd;
	}
	public void setrPassowrd(String rPassowrd) {
		this.rPassowrd = rPassowrd;
	}
	public User(int user_id, String name, String number, String email, String password, String rPassowrd) {
		super();
		User_id = user_id;
		this.name = name;
		this.number = number;
		this.email = email;
		this.password = password;
		this.rPassowrd = rPassowrd;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
}
