package cn.itcast.shop.user.adminaction;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.UserService;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 用户管理模块
 * @author Administrator
 *
 */
public class UserAdminAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	public User getModel() {
		// TODO Auto-generated method stub
		return user;
	}

	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}
	//查找所有的用户
	public String findAll(){
		if(page == null || page.equals("")) {
			page = 1;
		}
		PageBean<User> pageBean = userService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}

	//修改前
	public String edit(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			user = userService.findByUid(user.getUid());
			return "editSuccess";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "Success";
		}
	}
	//更新
	public String update(){
		userService.update(user);
		return "Success";
		
	}
	//删除
	public String delete(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
		User existUser = userService.findByUid(user.getUid());
		userService.delete(existUser);
		return "Success";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "Success";
		}
		
	}
	//拉黑用户
	public String defriend() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
		User existUser = userService.findByUid(user.getUid());
		existUser.setState(2);
		userService.update(existUser);
		return "Success";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "Success";
		}
	}
	//跳转到拉黑所有用户
	public String todefriend() {
		if(page == null || page.equals("")) {
			page = 1;
		}
		PageBean<User> pageBean = userService.finddefriend(page, 2);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		
		return "userdefriend";
	}
	//恢复用户
	public String redefriend() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
		User existUser = userService.findByUid(user.getUid());
		existUser.setState(1);
		userService.update(existUser);
		return "Success";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "Success";
		}
	}
	

	
}
