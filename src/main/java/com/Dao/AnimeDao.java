package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Anime;


@Repository
public class AnimeDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public List<Anime> getAllAnime(){
		String query = "select * from anime";
		NativeQuery<Anime> sq = this.factory.getCurrentSession().createNativeQuery(query,Anime.class);
		List<Anime> list = sq.list();
		return list;
	}
	
	@Transactional
	public Anime getAnimeById(int id) {
		return this.factory.getCurrentSession().find(Anime.class, id); 
	}
	
}
