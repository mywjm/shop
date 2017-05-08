package cn.itcast.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.order.domain.Order;
import cn.itcast.shop.order.domain.OrderItem;
import cn.itcast.shop.utils.PageHibernateCallback;

public class OrderDao extends HibernateDaoSupport {

	public void save(Order order) {
		this.getHibernateTemplate().save(order);
		
	}

	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}

	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);

	}

	public void delete(OrderItem orderItem) {
		this.getHibernateTemplate().delete(orderItem);
		
	}

	public OrderItem findByItemid(Integer itemid, Integer oid) {
		List<OrderItem> orderItems = (List<OrderItem>)this.getHibernateTemplate().find("from OrderItem  where itemid=? and oid=?",itemid,oid);
		if(orderItems!=null && orderItems.size()>0){
			return orderItems.get(0);
		}
		return null;
	}

	

	public int findCountUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid = ?";
		List<Long> list = this.getHibernateTemplate().find(hql,uid);
		if(list!=null && list.size() >0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<Order> findPageUid(Integer uid, int begin, int limit) {
		String hql = "select o from Order o where o.user.uid=?";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, new Object[]{uid},begin,limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
		
	}

	public void delete(Order order) {
		this.getHibernateTemplate().delete(order);
		
	}

	public int CountOrderItem(Integer oid) {
		String hql = "select count(*) from OrderItem  where oid=?";
		List<Long> list = this.getHibernateTemplate().find(hql,oid);
		if(list!=null && list.size() >0){
			return list.get(0).intValue();
		}
		return 0;
	}

	public List<OrderItem> findOrderItems(Integer oid) {
		List<OrderItem> orderItems = (List<OrderItem>)this.getHibernateTemplate().find("from OrderItem  where oid=?",oid);
		if(orderItems!=null && orderItems.size()>0){
			return orderItems;
		}
		return null;
	}
	//查询总数
	public int findCount() {
		String hql = "select count(*) from Order";
		List<Long> list = this.getHibernateTemplate().find(hql);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	public List<Order> findPage(int begin, int limit) {
		String hql = "from Order";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql,null,begin,limit));
		return list;
	}
	
	//根据state查询总数
	public int findCount1(Integer state) {
		String hql = "select count(*) from Order where state=?";
		List<Long> list = this.getHibernateTemplate().find(hql,state);
		if(list != null && list.size() > 0){
			return list.get(0).intValue();
		}
		return 0;
	}
	
	//根据state查询分页
	public List<Order> findPage1(int begin, int limit,Integer state) {
		String hql = "from Order where state=?";
		List<Order> list = this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql,new Object[]{state},begin,limit));
		return list;
	}
}
