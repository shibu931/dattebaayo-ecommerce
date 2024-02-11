package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Character;


@Repository
public class CharacterDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public List<Character> getAllCharacter(){
		String query= "select * from anime_character";
		NativeQuery<Character> result = this.factory.getCurrentSession().createNativeQuery(query,Character.class);
		List<Character> list = result.list();
		return list;
	}
	
	@Transactional
	public List<Character> getCharacByAnime(int animeId){
		String q = "from Character where animeId =:x ";
		Query<Character> query = this.factory.getCurrentSession().createQuery(q,Character.class);
		query.setParameter("x", animeId);
		List<Character> list=null;
		try {
			list= query.getResultList();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}
	
}
