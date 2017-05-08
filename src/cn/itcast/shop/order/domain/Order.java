package cn.itcast.shop.order.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import cn.itcast.shop.user.domain.Address;
import cn.itcast.shop.user.domain.User;

public class Order implements Serializable {
	private static final long serialVersionUID = 450290107512718367L;
	private Integer oid;
	private Double total;
	private Date ordertime;
	private Integer state;
	//uid
	private User user;
	//aid
	private Address address;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();
	//一个订单对应一条评论
	private Set<Comment> comments = new HashSet<Comment>();
	
	
	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	
	
	public Integer getOid() {
		return oid;
	}

	public void setOid(Integer oid) {
		this.oid = oid;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public Date getOrdertime() {
		return ordertime;
	}

	public void setOrdertime(Date ordertime) {
		this.ordertime = ordertime;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}

	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	
	
}
