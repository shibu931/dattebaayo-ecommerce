package com.Dao;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.Entities.Address;

import org.hibernate.query.*;

@Repository
public class AddressDao {

	@Autowired
	private SessionFactory factory;
	
	@Transactional
	public void saveAddress(Address address) {
		this.factory.getCurrentSession().save(address);
	}
	
	@Transactional
	public void updateAddress(Address address) {
		this.factory.getCurrentSession().merge(address);
	}
	@Transactional
	public Address getAddress(int u_id) {
		String q = "from Address where user_id =:x ";
		Query<Address> query = this.factory.getCurrentSession().createQuery(q,Address.class);
		query.setParameter("x", u_id);
		List<Address> address=null;
		try {
			address= query.getResultList();
			if(address.size()==0) {
				return new Address();
			}else {
				return address.get(0);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
}
