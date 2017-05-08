package cn.itcast.shop.product.domain;

import java.io.Serializable;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.hibernate.search.annotations.Analyzer;
import org.hibernate.search.annotations.DocumentId;
import org.hibernate.search.annotations.Field;
import org.hibernate.search.annotations.Indexed;
import org.wltea.analyzer.lucene.IKAnalyzer;

import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.order.domain.Comment;
import cn.itcast.shop.order.domain.OrderItem;
import cn.itcast.shop.user.domain.Favorites;

/**
 * @author Administrator
 *
 */
@Indexed
@Analyzer(impl = IKAnalyzer.class)
public class Product implements Serializable {
	private static final long serialVersionUID = 8392962040132691544L;
	@DocumentId
	private Integer pid;
	@Field
	private String pname;
	private Double market_price;
	private Double shop_price;
	private String image;
	private String pdesc;
	private Integer is_hot;
	private Date pdate;
	//三级分类的外键:使用三级分类的对象.
	private CategoryThird categoryThird;
	private Set<OrderItem> orderItems = new HashSet<OrderItem>();
	
	//一个产品可以在多个收藏中
	private Set<Favorites> favorites = new HashSet<Favorites>();
	//一个产品对应多条评论
	private Set<Comment> comments = new HashSet<Comment>();
	
	public Set<Comment> getComments() {
		return comments;
	}
	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}
	public Set<Favorites> getFavorites() {
		return favorites;
	}
	public void setFavorites(Set<Favorites> favorites) {
		this.favorites = favorites;
	}
	public Set<OrderItem> getOrderItems() {
		return orderItems;
	}
	public void setOrderItems(Set<OrderItem> orderItems) {
		this.orderItems = orderItems;
	}
	public Integer getPid() {
		return pid;
	}
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public Double getMarket_price() {
		return market_price;
	}
	public void setMarket_price(Double market_price) {
		this.market_price = market_price;
	}
	public Double getShop_price() {
		return shop_price;
	}
	public void setShop_price(Double shop_price) {
		this.shop_price = shop_price;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPdesc() {
		return pdesc;
	}
	public void setPdesc(String pdesc) {
		this.pdesc = pdesc;
	}
	public Integer getIs_hot() {
		return is_hot;
	}
	public void setIs_hot(Integer is_hot) {
		this.is_hot = is_hot;
	}
	public Date getPdate() {
		return pdate;
	}
	public void setPdate(Date pdate) {
		this.pdate = pdate;
	}
	public CategoryThird getCategoryThird() {
		return categoryThird;
	}
	public void setCategoryThird(CategoryThird categoryThird) {
		this.categoryThird = categoryThird;
	}
	@Override
	public String toString() {
		return "Product [pid=" + pid + ", pname=" + pname + ", market_price="
				+ market_price + ", shop_price=" + shop_price + ", image="
				+ image + ", pdesc=" + pdesc + ", is_hot=" + is_hot
				+ ", pdate=" + pdate + ", categoryThird=" + categoryThird + "]";
	}
	
}
