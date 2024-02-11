package com.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.Dao.AddressDao;
import com.Entities.Address;

@Service
public class AddressService {

	@Autowired
	private AddressDao addressDao;
	
	public void saveAddress(Address address ) {
		this.addressDao.saveAddress(address);
	}
	
	public void updateAddress(Address address) {
		this.addressDao.updateAddress(address);
	}
	
	public Address getAddress(int user_id) {
		return this.addressDao.getAddress(user_id);
	}
}
