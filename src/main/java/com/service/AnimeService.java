package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.AnimeDao;
import com.Entities.Anime;

@Service
public class AnimeService {

	@Autowired
	AnimeDao animeDao;
	
	public List<Anime> getAllAnime(){
		return this.animeDao.getAllAnime();
	}
	
	public Anime getanimeById(int id) {
		return this.animeDao.getAnimeById(id);
	}
	
}
