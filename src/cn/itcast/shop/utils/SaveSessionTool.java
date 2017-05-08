package cn.itcast.shop.utils;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.category.service.CategoryService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class SaveSessionTool extends ActionSupport {
	private  CategoryService categoryService; 
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	
	/**
	 * 保存导航栏如果session过期重新加载
	 */
	public void saveSession(){
		List<Category> exitclist = (List<Category>) ServletActionContext.getRequest().getSession().getAttribute("cList");
		if(exitclist == null) {
			//菜单栏
			List<Category> cList1 = categoryService.findAll();
			List<Category> cList = new ArrayList<Category>();
			List<Category> clistMore = new ArrayList<Category>();
			int i = 0;
			for(Category category : cList1) {
				if(i<9){
					cList.add(category);
				}else{
					clistMore.add(category);
				}
				i++;
			}
			ActionContext.getContext().getSession().put("cList", cList);
			ActionContext.getContext().getSession().put("clistMore", clistMore);
			ServletActionContext.getRequest().getSession().setMaxInactiveInterval(-1);
		}
		
	}
	
	//返回所有一级菜单
	public List<Category> getCategory() {
		List<Category> clist = categoryService.findAll();
		return clist;
	}
}
