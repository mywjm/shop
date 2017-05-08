package cn.itcast.shop.categorysecond.adminCategorySecondAction;

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

public class AdminCSAction extends ActionSupport implements ModelDriven<CategorySecond>{
	CategorySecond categorySecond = new CategorySecond();
	public CategorySecond getModel() {
		// TODO Auto-generated method stub
		return categorySecond;
	}
	private CategorySecondService categorySecondService;
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	private  CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	private String cid;
	

	public void setCid(String cid) {
		this.cid = cid;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	
	//查询所有二级分类
	public String findAll(){
		if(page == null){
			page = 1;
		}
		PageBean<CategorySecond> pageBean = categorySecondService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	//跳转到二级分类的编辑
	public String edit(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			CategorySecond categorySecondedit = categorySecondService.findByCsid(categorySecond.getCsid());
			if(categorySecondedit != null){
				ActionContext.getContext().getValueStack().set("cs", categorySecondedit);
			}
			List<Category> list = categoryService.findAll();
			ActionContext.getContext().getValueStack().set("list", list);
			return "edit";
		}else {
			this.addActionMessage("游客无法修改内容!请登录后修改！");
		}
		return "success";
	
	}
	//更新二级分类
	public String update(){
		String[] s = cid.split(",");
		Category category = categoryService.findByCid(Integer.valueOf(s[0].trim()));
		CategorySecond updateCategorySecond = categorySecondService.findByCsid(categorySecond.getCsid());
		updateCategorySecond.setCategory(category);
		updateCategorySecond.setCsname(categorySecond.getCsname());
		categorySecondService.update(updateCategorySecond);
		return "edited";
	}
	
	//转到添加二级菜单分类
	public String toAdd() {
		List<Category> list = categoryService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "toAdd";
	}
	
	//添加二级菜单
	public String add() {
		Category category = categoryService.findByCid(Integer.valueOf(cid));
		CategorySecond addcategorySecond = new CategorySecond();
		addcategorySecond.setCategory(category);
		addcategorySecond.setCsname(categorySecond.getCsname());
		categorySecondService.saveCS(addcategorySecond);
		return "success";
	}
}
