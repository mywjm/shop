package cn.itcast.shop.user.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.user.dao.UserDao;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.utils.PageBean;
@Transactional
@Service
public class UserService {
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	
	// 按用户名查询用户的方法:
	public User findByNickname(String nickname){
		return userDao.findByNickname(nickname);
	}

	// 业务层完成用户注册代码:
	
	public void save(User user) {
		// 将数据存入到数据库
		user.setState(1); // 0:代表用户未激活.  1:代表用户已经激活.
		user.setCode(null);
		//md5加密
		String password = DigestUtils.md5Hex(user.getPassword());
		user.setPassword(password);
		userDao.save(user);
		
	}

	// 业务层根据激活码查询用户
	public User findByCode(String code) {
		return userDao.findByCode(code);
	}

	// 修改用户的状态的方法
	public void update(User existUser) {
		//md5加密
		String password = DigestUtils.md5Hex(existUser.getPassword());
		existUser.setPassword(password);
		userDao.update(existUser);
	}

	// 用户登录的方法
	public User loginByEmail(User user) {
		return userDao.loginByEmail(user);
	}
	// 用户登录的方法
	public User loginByNickname(User user) {
		return userDao.loginByNickname(user);
	}


	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean = new PageBean<User>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = userDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit);
		pageBean.setList(list);
		
		return pageBean;
	}
	//查拉黑名单
	public PageBean<User> finddefriend(Integer page, Integer state) {
		PageBean<User> pageBean = new PageBean<User>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = userDao.findCount(state);
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page - 1)*limit;
		List<User> list = userDao.findByPage(begin,limit,state);
		pageBean.setList(list);
		return pageBean;
	}

	public User findByUid(Integer uid) {
		
		return userDao.findByUid(uid);
	}


	public void delete(User existUser) {
		userDao.delete(existUser);
		
	}


	public User findByEmail(String email) {
		// TODO Auto-generated method stub
		return userDao.findByEmail(email);
	}
}
