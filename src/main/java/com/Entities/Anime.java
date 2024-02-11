package com.Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "anime")
public class Anime {

	@Id
	@GeneratedValue(generator = "anime_seq", strategy = GenerationType.AUTO)
	@Column(name = "animeId")
	private int id;
	private String anime;
	
	public Anime() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Anime(int id, String anime) {
		super();
		this.id = id;
		this.anime = anime;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAnime() {
		return anime;
	}
	public void setAnime(String anime) {
		this.anime = anime;
	}
	
}
