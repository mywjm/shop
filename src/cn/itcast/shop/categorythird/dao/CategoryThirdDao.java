package cn.itcast.shop.categorythird.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.utils.PageHibernateCallback;

public class CategoryThirdDao extends HibernateDaoSupport{
	//插入三级菜单
	public void save(CategoryThird categoryThird) {
		this.getHibernateTemplate().save(categoryThird);
	}
	//根据csid查找
	public List<CategoryThird> findByCsid(Integer csid) {
		String hql = "from CategoryThird where csid = ?";
		List<CategoryThird> list = this.getHibernateTemplate().find(hql,csid);
		if(list!=null && list.size() > 0){
			return list;
		}
		return null;
	}
	public CategoryThird findByCtid(int ctid) {
		String hql = "from CategoryThird where ctid = ?";
		List<CategoryThird> list = this.getHibernateTemplate().find(hql,ctid);
		if(list!=null && list.size() > 0){
			return list.get(0);
		}
		return null;
	}
	public int findCount() {
		String hql = "select count(*) from CategoryThird";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	public List<CategorySecond> findByPage(int begin, int limit) {
		String hql = "from CategoryThird";
		List<CategorySecond> list = this.getHibernateTemplate().execute(new PageHibernateCallback<CategorySecond>(hql,null,begin,limit));
		return list;
	}
	public List<CategorySecond> findAll() {
		String hql = "from CategorySecond";
		List<CategorySecond> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	public List<CategoryThird> findThird() {
		String hql = "from CategoryThird";
		List<CategoryThird> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	public void update(CategoryThird updatecategoryThird) {
		this.getHibernateTemplate().update(updatecategoryThird);
		
	}
	
}
