package cn.itcast.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.user.domain.Address;

public class AddressDao extends HibernateDaoSupport{
	//根据uid查找所有的地址
	public List<Address> findByUid(Integer uid) {
		String sql = "from Address where uid=?";
		List<Address> list = this.getHibernateTemplate().find(sql, uid);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public Address findByAid(Integer aid) {
		String sql = "from Address where aid=?";
		List<Address> list = this.getHibernateTemplate().find(sql, aid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void save(Address address) {
		this.getHibernateTemplate().save(address);
		
	}

	public void delete(Address delete_address) {
		this.getHibernateTemplate().delete(delete_address);
		
	}

	public void update(Address update_address) {
		this.getHibernateTemplate().update(update_address);
		
	}
}
