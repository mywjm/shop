package cn.itcast.shop.order.domain;

import java.io.Serializable;

import cn.itcast.shop.product.domain.Product;

public class Comment implements Serializable {
	private static final long serialVersionUID = 7866579511973603204L;
	private Integer comid;
	//图和实物相符程度
	private Integer matcher;
	//客服评分
	private Integer customer_service;
	//物流评分
	private Integer express_service ;
	//评价内容
	private String content;
	private Order order;
	private Product product;
	public Integer getComid() {
		return comid;
	}
	public void setComid(Integer comid) {
		this.comid = comid;
	}
	public Integer getMatcher() {
		return matcher;
	}
	public void setMatcher(Integer matcher) {
		this.matcher = matcher;
	}
	public Integer getCustomer_service() {
		return customer_service;
	}
	public void setCustomer_service(Integer customer_service) {
		this.customer_service = customer_service;
	}
	public Integer getExpress_service() {
		return express_service;
	}
	public void setExpress_service(Integer express_service) {
		this.express_service = express_service;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
}
