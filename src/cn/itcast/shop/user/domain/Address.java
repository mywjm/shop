package cn.itcast.shop.user.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import cn.itcast.shop.order.domain.Order;
/**
 * 收货地址管理类
 * @author Administrator
 *
 */
public class Address implements Serializable{
	private static final long serialVersionUID = 3692005159750145703L;
	private Integer aid;
	//收货人
	private String consignee;
	//电话
	private String phone;
	//收货地址
	private String addr;
	//当前用户
	private User user;
	//多个订单在同一个地址
	private Set<Order> orders = new HashSet<Order>();
	public Set<Order> getOrders() {
		return orders;
	}
	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}
	public Integer getAid() {
		return aid;
	}
	public void setAid(Integer aid) {
		this.aid = aid;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	@Override
	public String toString() {
		return "Address [aid=" + aid + ", consignee=" + consignee + ", phone="
				+ phone + ", addr=" + addr + ", user=" + user + "]";
	}
	
}
