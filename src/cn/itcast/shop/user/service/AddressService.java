package cn.itcast.shop.user.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.user.dao.AddressDao;
import cn.itcast.shop.user.domain.Address;

@Transactional
@Service
public class AddressService {
	private AddressDao addressDao;

	public void setAddressDao(AddressDao addressDao) {
		this.addressDao = addressDao;
	}
	
	//根据uid查所有地址
	public List<Address> findByUid(Integer uid) {
		return addressDao.findByUid(uid);
	}

	public Address findByAid(Integer aid) {
		// TODO Auto-generated method stub
		return addressDao.findByAid(aid);
	}

	public void save(Address address) {
		addressDao.save(address);
		
	}

	public void delete(Address delete_address) {
		addressDao.delete(delete_address);
		
	}

	public void update(Address update_address) {
		addressDao.update(update_address);
		
	}
}
