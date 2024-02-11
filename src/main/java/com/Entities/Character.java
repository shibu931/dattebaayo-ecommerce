package com.Entities;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="anime_character")
public class Character {

	@Id
	@GeneratedValue(generator = "anime_character_seq", strategy = GenerationType.AUTO)
	@Column(name = "char_id")
	private int id;
	private String charc;
	private int animeId; 
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCharc() {
		return charc;
	}
	public void setCharc(String charc) {
		this.charc = charc;
	}
	public int getAnimeId() {
		return animeId;
	}
	public void setAnimeId(int animeId) {
		this.animeId = animeId;
	}
	public Character(int id, String charc, int animeId) {
		super();
		this.id = id;
		this.charc = charc;
		this.animeId = animeId;
	}
	public Character() {
		super();
		// TODO Auto-generated constructor stub
	}
	@Override
	public String toString() {
		return "Character [id=" + id + ", charc=" + charc + ", animeId=" + animeId + "]";
	}
	
}
