package cn.itcast.shop.category.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import cn.itcast.shop.categorysecond.domian.CategorySecond;

public class Category implements Serializable {
	private static final long serialVersionUID = 7124356368316451988L;
	private Integer cid;
	private String cname;
	//二级分类
	private Set<CategorySecond> categorySeconds = new HashSet<CategorySecond>();
	
	
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public Set<CategorySecond> getCategorySeconds() {
		return categorySeconds;
	}
	public void setCategorySeconds(Set<CategorySecond> categorySeconds) {
		this.categorySeconds = categorySeconds;
	}
	
	
}
