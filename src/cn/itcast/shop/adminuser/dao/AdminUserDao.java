package cn.itcast.shop.adminuser.dao;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.utils.PageHibernateCallback;

public class AdminUserDao extends HibernateDaoSupport {

	public AdminUser login(AdminUser adminUser) {
		String password = DigestUtils.md5Hex(adminUser.getPassword());
		String hql = "from AdminUser where username = ? and password = ?";
		List<AdminUser> list = this.getHibernateTemplate().find(hql,adminUser.getUsername(),password);
		if(list != null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	public void save(AdminUser adminUser) {
		this.getHibernateTemplate().save(adminUser);
		
	}
	//所有管理员数量
	public int findCount() {
		String hql = "select count(*) from AdminUser";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<AdminUser> findByPage(int begin, int limit) {
		String hql = "from AdminUser";
		List<AdminUser> list = this.getHibernateTemplate().execute(new PageHibernateCallback<AdminUser>(hql,null,begin,limit));
		return list;
		
	}

	public AdminUser findByaid(Integer auid) {
		String hql = "from AdminUser where auid=?";
		List<AdminUser> list = this.getHibernateTemplate().find(hql,auid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	public void delete(AdminUser deleteAdminUser) {
		this.getHibernateTemplate().delete(deleteAdminUser);
		
	}

	public void update(AdminUser updateAdminUser) {
		this.getHibernateTemplate().update(updateAdminUser);
		
	}

}
