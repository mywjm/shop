package cn.itcast.shop.user.domain;

import java.io.Serializable;

import cn.itcast.shop.product.domain.Product;

public class Favorites implements Serializable {
	private static final long serialVersionUID = 5748916375346722942L;
	private Integer fid;
	private User user;
	private Product product;
	public Integer getFid() {
		return fid;
	}
	public void setFid(Integer fid) {
		this.fid = fid;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
