package cn.itcast.shop.order.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.order.dao.OrderDao;
import cn.itcast.shop.order.domain.Order;
import cn.itcast.shop.order.domain.OrderItem;
import cn.itcast.shop.utils.PageBean;
@Transactional
public class OrderService {
	private OrderDao orderDao;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	public void save(Order order) {
		this.orderDao.save(order);
	}

	public Order findByOid(Integer oid) {
		
		return orderDao.findByOid(oid);
	}

	public void update(Order currOrder) {
		orderDao.update(currOrder);
	}

	public void delete(OrderItem orderItem) {
		
		orderDao.delete(orderItem);
		
	}

	public OrderItem findByItemid(Integer itemid, Integer oid) {
		
		return orderDao.findByItemid(itemid,oid);
	}

	public PageBean<Order> findByUid(Integer uid, int page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		//设置当前页
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 8;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = orderDao.findCountUid(uid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount%limit == 0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//每页显示的数据集合
		int begin = (page-1)*limit;
		List<Order> list = orderDao.findPageUid(uid,begin,limit);
		pageBean.setList(list);
		return pageBean;
		
	}

	public void delete(Order order) {
		orderDao.delete(order);
		
	}

	public int CountOrderItems(Integer oid) {
		
		return orderDao.CountOrderItem(oid);
	}

	public List<OrderItem> findOrderItems(Integer oid) {
		// TODO Auto-generated method stub
		return orderDao.findOrderItems(oid);
	}

	public PageBean<Order> findByPage(Integer page) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPage(page);
		int limit = 6;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = orderDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<Order> list = orderDao.findPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public PageBean<Order> findByState(int page, Integer state) {
		PageBean<Order> pageBean = new PageBean<Order>();
		pageBean.setPage(page);
		int limit = 5;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = orderDao.findCount1(state);
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<Order> list = orderDao.findPage1(begin,limit,state);
		pageBean.setList(list);
		return pageBean;
	}


	
	
}
