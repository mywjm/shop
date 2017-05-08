package cn.itcast.shop.utils;

import java.util.List;

/**
 * 封装页面
 * 
 *
 */
public class PageBean<T> {
	private int page;	// 页码
	private int totalCount; // 总数
	private int totalPage; // 总页数
	private int limit;	// 每页显示数目
	private List<T> list; // 某个类集合
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
}
