package com.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.CharacterDao;
import com.Entities.Character;

@Service
public class CharacterService {

	@Autowired
	CharacterDao characterDao;
	
	public List<Character> getAllCharacter(){
		List<Character> list= this.characterDao.getAllCharacter();
		return list;
	}
	
	public List<Character> getAnimeCharacter(int animeId){
		return this.characterDao.getCharacByAnime(animeId);
	}
	
}
