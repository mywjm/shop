package cn.itcast.shop.categorysecond.domian;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.categorythird.domain.CategoryThird;

public class CategorySecond implements Serializable{
	private static final long serialVersionUID = -8114049739157502902L;
	private Integer csid;
	private String csname;
	private Category category;
	
	private Set<CategoryThird> categoryThird = new HashSet<CategoryThird>();

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public String getCsname() {
		return csname;
	}

	public void setCsname(String csname) {
		this.csname = csname;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Set<CategoryThird> getCategoryThird() {
		return categoryThird;
	}

	public void setCategoryThird(Set<CategoryThird> categoryThird) {
		this.categoryThird = categoryThird;
	}

	
}
