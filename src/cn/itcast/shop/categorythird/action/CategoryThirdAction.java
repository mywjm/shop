package cn.itcast.shop.categorythird.action;

import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.categorythird.service.CategoryThirdService;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class CategoryThirdAction extends ActionSupport implements ModelDriven<CategoryThird>{
	private CategoryThird categoryThird = new CategoryThird();
	public CategoryThird getModel() {
		// TODO Auto-generated method stub
		return categoryThird;
	}
	private CategorySecondService categorySecondService;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	private CategoryThirdService categoryThirdService;
	public void setCategoryThirdService(CategoryThirdService categoryThirdService) {
		this.categoryThirdService = categoryThirdService;
	}
	
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	private Integer csid;
	
	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	//所有三级菜单
	public String findAll() {
		if(page == null) {
			page = 1;
		}
		PageBean<CategorySecond> pageBean = categoryThirdService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	
	//跳转到添加三级菜单
	public String toAdd() {
		List<CategorySecond> list = categoryThirdService.findAll();
		ActionContext.getContext().getValueStack().set("list", list);
		return "toAdd";
	}
	//添加三级菜单
	public String add() {
		CategorySecond categorySecond = categorySecondService.findByCsid(csid);
		CategoryThird addcategoryThird = new CategoryThird();
		addcategoryThird.setCategorySecond(categorySecond);
		addcategoryThird.setCtname(categoryThird.getCtname());
		categoryThirdService.saveCategoryThird(addcategoryThird);
		return "success";
	}
	
	//跳转到修改
	public String edit() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			CategoryThird categoryThirdedit = categoryThirdService.findByCtid(categoryThird.getCtid());
			if(categoryThirdedit != null){
				ActionContext.getContext().getValueStack().set("ct", categoryThirdedit);
			}
			List<CategorySecond> list = categoryThirdService.findAll();
			ActionContext.getContext().getValueStack().set("list", list);
			return "edit";
		}else {
			this.addActionMessage("游客无法修改内容!请登录后修改！");
		}
		return "success";

	}
	
	//修改三级菜单
	public String update() {
		CategorySecond categorySecond = categorySecondService.findByCsid(csid);
		CategoryThird updateCategoryThird = categoryThirdService.findByCtid(categoryThird.getCtid());
		updateCategoryThird.setCategorySecond(categorySecond);
		updateCategoryThird.setCtname(categoryThird.getCtname());
		categoryThirdService.update(updateCategoryThird);
		return "success";
	}
	
}
