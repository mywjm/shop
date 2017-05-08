package cn.itcast.shop.product.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.utils.PageHibernateCallback;

public class ProductDao extends HibernateDaoSupport{

	public List<Product> findHot(int begin) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.add(Restrictions.eq("is_hot", 1));
//		criteria.addOrder(Order.asc("pid"));
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria,begin,3);
		return list;
	}

	public List<Product> findNew(int begin, int limit) {
		DetachedCriteria criteria = DetachedCriteria.forClass(Product.class);
		criteria.addOrder(Order.desc("pdate"));
		List<Product> list = this.getHibernateTemplate().findByCriteria(criteria,begin,limit);
		List<Product> plist = new ArrayList<Product>();
		for(Product p : list) {
			if(p.getPdate()!=null) {
				plist.add(p);
			}
		}
		
		return plist;
	}
	
	public int findCountCsid(Integer csid) {
		String hql = "select count(*) from Product p where p.categoryThird.categorySecond.csid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql, csid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public Product findByPid(Integer pid) {
		
		return this.getHibernateTemplate().get(Product.class, pid);
	}
	//根据cid查商品总数
	public int findCountCid(Integer cid) {
		String hql = "select count(*) from Product p where p.categoryThird.categorySecond.category.cid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,cid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//根据二级分类查询商品信息
	public List<Product> findByPageCsid(Integer csid, int begin, int limit) {
		String hql = "select p from Product p join p.categoryThird ct join ct.categorySecond cs where cs.csid =? ";
		List<Product> list1 = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{csid}, begin, limit));
		List<Product> list =  new ArrayList<Product>();
		List<Product> list2 =  new ArrayList<Product>();
		if(list1 != null && list1.size()>0){
			for(Product product : list1) {
				if(product != null){
					list.add(product);
				}
			}
			if(list.size()%4==0){
				return list;
			}else{
				for(int i = 0; i<(list.size()-list.size()%4); i++){
					list2.add(list.get(i));
				}
				return list2;
			}
			
		}
		return null;
	}
	//根据cid查产品
	public List<Product> findByPageCid(Integer cid, int begin, int limit) {
		String hql = "select p from Product p join p.categoryThird ct join ct.categorySecond cs join cs.category c where c.cid = ?";
		List<Product> list1 = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{cid}, begin, limit));
		List<Product> list =  new ArrayList<Product>();
		List<Product> list2 =  new ArrayList<Product>();
		if(list1 != null && list1.size()>0){
			for(Product product : list1) {
				if(product != null){
					list.add(product);
				}
			}
			if(list.size()%4==0){
				return list;
			}else{
				for(int i = 0; i<(list.size()-list.size()%4); i++){
					list2.add(list.get(i));
				}
				return list2;
			}
			
		}
		return null;
	}

	public void saveProduct(Product product){
		this.getHibernateTemplate().save(product);
	}

	public int findCount() {
		String hql = "select count(*) from Product where is_hot < 2";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findByPage(int begin, int limit) {
		String hql = "from Product where is_hot < 2";
		List<Product> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql,null,begin,limit));
		return list;
		
	}

	public void update(Product product) {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(product);
	}

	public List<Product> findByHot(int hot) {
		String sql = "from Product where is_hot = ?";
		List<Product> list = this.getHibernateTemplate().find(sql,hot);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}
	//根据cid查商品
	public List<Product> findByCtid(Integer ctid) {
		String sql = "from Product where ctid = ?";
		List<Product> list = this.getHibernateTemplate().find(sql,ctid);
		if(list != null && list.size() > 0) {
			return list;
		}
		return null;
	}

	public int findCountCtid(int ctid) {
		String hql = "select count(*) from Product p where p.categoryThird.ctid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,ctid);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Product> findByPageCtid(int ctid, int begin, int limit) {
		String hql = "from Product where ctid = ?";
		List<Product> list1 = this.getHibernateTemplate().execute(new PageHibernateCallback<Product>(hql, new Object[]{ctid}, begin, limit));
		List<Product> list =  new ArrayList<Product>();
		List<Product> list2 =  new ArrayList<Product>();
		if(list1 != null && list1.size()>0){
			for(Product product : list1) {
				if(product != null){
					list.add(product);
				}
			}
			if(list.size()%4==0){
				return list;
			}else{
				for(int i = 0; i<(list.size()-list.size()%4); i++){
					list2.add(list.get(i));
				}
				return list2;
			}
			
		}
		return null;
	}
}
