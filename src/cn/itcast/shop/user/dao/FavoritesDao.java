package cn.itcast.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.user.domain.Favorites;

public class FavoritesDao extends HibernateDaoSupport {
	//±£¥ÊµΩ ’≤ÿº–
	public void save(Favorites favorites) {
		this.getHibernateTemplate().save(favorites);
	}

	public Favorites findFavorites(Integer uid, Integer pid) {
		String sql  = "from Favorites where user.uid=? and product.pid=?";
		List<Favorites> list = this.getHibernateTemplate().find(sql, uid, pid);
	if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public List<Favorites> findByUid(Integer uid) {
		String sql = "from Favorites where user.uid= ? ";
		List<Favorites> list = this.getHibernateTemplate().find(sql, uid);
		if(list!= null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public void delete(Favorites favorites) {
	
		this.getHibernateTemplate().delete(favorites);
		
	}
	
}
