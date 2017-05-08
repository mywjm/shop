package cn.itcast.shop.category.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.utils.PageHibernateCallback;

public class CategoryDao extends HibernateDaoSupport{

	public List<Category> find() {
		String hql = "from Category";
		return this.getHibernateTemplate().find(hql);
	}

	public int findCount() {
		String hql = "select count(*) from Category";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Category> findByPage(int begin, int limit) {
		String hql = "from Category";
		List<Category> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Category>(hql,null,begin,limit));
		return list;
		
	}
	//根据cid查找category
	public Category findByCid(Integer cid) {
		String hql = "from Category where cid=?";
		List<Category> list = this.getHibernateTemplate().find(hql, cid);
		if(list!=null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}

	public void update(Category category) {
		this.getHibernateTemplate().update(category);
		
	}
	//新增category
	public void saveCategory(Category category) {
		this.getHibernateTemplate().save(category);
	}

	public List<Category> findByCids(int begin, int end) {
		String hql = "from Category where cid between ? and ?";
		List<Category> list = this.getHibernateTemplate().find(hql, begin, end);
		if(list!=null && list.size() > 0){
			return  list;
		}
		return null;
	}
	
}
