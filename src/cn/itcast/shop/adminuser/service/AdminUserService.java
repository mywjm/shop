package cn.itcast.shop.adminuser.service;

import java.util.List;

import cn.itcast.shop.adminuser.dao.AdminUserDao;
import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.utils.PageBean;

public class AdminUserService {
	private AdminUserDao adminUserDao;
	
	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}

	public AdminUser login(AdminUser adminUser) {
		
		return adminUserDao.login(adminUser);
	}

	public void save(AdminUser adminUser) {
		adminUserDao.save(adminUser);
		
	}
	//°´Ò³Êý²éÑ¯
	public PageBean<AdminUser> findByPage(Integer page) {
		PageBean<AdminUser> pageBean = new PageBean<AdminUser>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount =  adminUserDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1)*limit;
		
		List<AdminUser> list = adminUserDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public AdminUser findByaid(Integer auid) {
		
		return adminUserDao.findByaid(auid);
	}

	public void delete(AdminUser deleteAdminUser) {
		adminUserDao.delete(deleteAdminUser);
		
	}

	public void update(AdminUser updateAdminUser) {
		adminUserDao.update(updateAdminUser);
		
	}

}
