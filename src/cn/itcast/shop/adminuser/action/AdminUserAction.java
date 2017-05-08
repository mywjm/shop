package cn.itcast.shop.adminuser.action;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.adminuser.service.AdminUserService;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
/**
 * 后台管理员登陆模块
 * @author Administrator
 *
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	private AdminUser adminUser = new AdminUser();
	public AdminUser getModel() {
		// TODO Auto-generated method stub
		return adminUser;
	}
	private String root;

	public void setRoot(String root) {
		this.root = root;
	}
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}
	private AdminUserService adminUserService;
	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	//首页
	public String index(){
		return "index";
	}
	//登陆页
	public String loginPage() {
		return "loginPage";
	}
	//登陆
	public String login(){
		AdminUser existAdminUser = adminUserService.login(adminUser);
		
		if(existAdminUser == null){
			this.addActionMessage("用户不存在！");
			return "loginFail";
		}else{
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}
	

	//退出登陆
	public String quit(){
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}
	
	//异步添加
	public String add() {
		if(adminUser.getUsername() != null && !adminUser.getUsername().equals("")) {
			if(root.equals("sorry")) {
				//0代表普通管理员
				adminUser.setPrivilege(0);
				String password = DigestUtils.md5Hex(adminUser.getPassword());
				adminUser.setPassword(password);
				adminUserService.save(adminUser);
			}
		}
		return NONE;
	}
	
	//所有管理员
	public String findAdmins() {
		if(page == null) {
			page = 1;
		}
		//查询所有管理员
		PageBean<AdminUser> pageBean = adminUserService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAdmins";
	}
	//跳转到添加页面
	public String toAdd() {
		return "toAdd";
	}
	//添加管理员
	public String addAdmin() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null && existAdminUser.getPrivilege().equals(1)) {
			if(adminUser.getUsername() != null &&
					!adminUser.getUsername().equals("")&& adminUser.getPassword() != null 
					&& !adminUser.getPassword().equals("")) {
				//0代表普通管理员
				adminUser.setPrivilege(0);
				String password = DigestUtils.md5Hex(adminUser.getPassword());
				adminUser.setPassword(password);
				adminUserService.save(adminUser);
				return "success";
			}else{
				this.addActionMessage("用户名和密码不允许为空！");
				return "toAdd";
			}
		}else{
			this.addActionMessage("权限不足");
			return "toAdd";
		}

		
	}
	
	//删除管理员
	public String delete() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null && existAdminUser.getPrivilege() == 1) {
			
			AdminUser deleteAdminUser = adminUserService.findByaid(adminUser.getAuid());
			if(deleteAdminUser != null) {
				adminUserService.delete(deleteAdminUser);
			}
		}else {
			this.addActionMessage("权限不足");
		}
		return "success";
	}
	
	//跳转修改
	public String edit() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null && existAdminUser.getPrivilege() == 1) {
			
			AdminUser updateAdminUser = adminUserService.findByaid(adminUser.getAuid());
			if(updateAdminUser != null) {
				ServletActionContext.getContext().getValueStack().set("editUser", updateAdminUser);
			}
		}else {
			this.addActionMessage("权限不足");
			return "success";
		}
		return "edit";
	}
	
	//修改
	public String editAdmin(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser != null && existAdminUser.getPrivilege() == 1) {
			
			AdminUser updateAdminUser = adminUserService.findByaid(adminUser.getAuid());
			if(updateAdminUser != null) {
				if(adminUser.getUsername() != null) {
					updateAdminUser.setUsername(adminUser.getUsername());
				}
				if(adminUser.getPassword() != null) {
					String password  = DigestUtils.md5Hex(adminUser.getPassword());
					updateAdminUser.setPassword(password);
				}
				adminUserService.update(updateAdminUser);
			}
		}else {
			this.addActionMessage("权限不足");
		}
		return "success";
	}
	
}
