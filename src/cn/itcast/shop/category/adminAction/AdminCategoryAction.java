package cn.itcast.shop.category.adminAction;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	private  CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}
	Category category = new Category();
	public Category getModel() {
		return category;
	}
	//查询所有一级分类
	public String findAll(){
		if(page == null){
			page = 1;
		}
		PageBean<Category> pageBean = categoryService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	//跳转一级分类编辑
	public String edit(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			Category categoryedit = categoryService.findByCid(category.getCid());
			if(categoryedit!=null){
				ActionContext.getContext().getValueStack().set("categoryedit", categoryedit);
			}
			return "edit";
		}else{
			this.addActionMessage("权限不足！");
			return "edited";
		}
	}
	
	//修改一级分类
	public String update(){
		Category updateCategory = categoryService.findByCid(category.getCid());
		updateCategory.setCname(category.getCname());
		categoryService.update(updateCategory);
		return "edited";
	}
	//删除一级分类
	public String delete() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null && existAdminUser.getPrivilege().equals(1)) {
			
			
		}
		return "delete";
	}
	
	//跳转添加一级菜单
	public String toadd() {
		
		return "toadd";
	}
	
	//添加一级菜单
	public String add() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null ) {
			categoryService.saveCategory(category);
		}else {
			this.addActionMessage("游客无法修改内容!请登录后修改！");
		}
		return "add";
	}
}
