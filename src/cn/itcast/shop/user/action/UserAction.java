package cn.itcast.shop.user.action;

import java.io.IOException;
import java.text.MessageFormat;
import java.util.List;
import java.util.Properties;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.itcast.mail.Mail;
import cn.itcast.mail.MailUtils;
import cn.itcast.shop.cart.domain.Cart;
import cn.itcast.shop.user.domain.Address;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.AddressService;
import cn.itcast.shop.user.service.UserService;
import cn.itcast.shop.utils.SaveSessionTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class UserAction extends ActionSupport implements ModelDriven<User>{
	private User user = new User();
	private UserService userService;

	private String temp;
	public void setTemp(String temp) {
		this.temp = temp;
	}

	public void setSaveSessionTool(SaveSessionTool saveSessionTool) {
		this.saveSessionTool = saveSessionTool;
	}

	private SaveSessionTool saveSessionTool;

	
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	private String checkcode;
	
	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}
	/**
	 * 清除信息
	 */
	public void clearMessages(){
		this.clearErrorsAndMessages();
		this.clearActionErrors();
	}
	
	public User getModel() {
		saveSessionTool.saveSession();
		this.clearMessages();
		return user;
	}
	/**
	 * 转到登录页面
	 */
	public String loginPage(){
		return "loginPage";
	}
	/**
	 * 登录
	 */
	public String login(){
	    // 邮箱验证规则
	    String regEx = "\\w+(\\.\\w)*@\\w+(\\.\\w{2,3}){1,3}";
	    // 编译正则表达式
	    Pattern pattern = Pattern.compile(regEx);
	    // 忽略大小写的写法
	    // Pattern pat = Pattern.compile(regEx, Pattern.CASE_INSENSITIVE);
	    Matcher matcher = pattern.matcher(temp);
	    // 字符串是否与正则表达式相匹配
	    boolean rs = matcher.matches();
	    User exitsUser = null;
		if(rs){
			//邮箱登陆
			user.setEmail(temp);
			//查找用户是否存在
			exitsUser = userService.loginByEmail(user);
		}else{
			//用户名登陆
			user.setNickname(temp);
			//查找用户是否存在
			exitsUser = userService.loginByNickname(user);
		}
		
		if(exitsUser==null){
			this.addActionMessage("用户名不存在或者密码错误");
			return "loginfail";
		}
		Cart cart = new Cart();
		ServletActionContext.getRequest().getSession().setAttribute("cart", cart);
		ServletActionContext.getRequest().getSession().setAttribute("exitsUser", exitsUser);
		return "loginsuccess";
	}
	
	
	/**
	 * 跳转到注册页面
	 */
	public String registPage(){
		return "registPage";
	}
	
	/**
	 * 注册
	 * @throws IOException 
	 */
	public String userRegist() throws IOException{
		String code = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if(!checkcode.equalsIgnoreCase(code)){
			this.addActionError("验证码错误！");
			return "input";
		}
		//激活码对比
		String activecode = (String) ServletActionContext.getRequest().getSession().getAttribute("activecode");
		if(activecode != null && activecode.equals(user.getCode())) {
			User exitemailUser = userService.findByEmail(user.getEmail());
			//校验邮箱唯一性
			if(exitemailUser != null) {
				this.addActionError("该邮箱已经注册过");
				return "input";
			}else{
				userService.save(user);
				this.addActionMessage("注册成功!");
			} 
		}else{
			this.addActionError("激活码错误");
			return "input";
		}
		return "msg";
	}
	
	/**
	 * AJAX异步交互查昵称
	 * @throws IOException 
	 */
	public String findByName() throws IOException{
		User existUser = userService.findByNickname(user.getNickname());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}
	//ajax 发送激活码到用户邮箱
	public String sendActive() {
		String words =  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
		Random random = new Random();
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			int index = random.nextInt(words.length()); 
			char c = words.charAt(index);
			sb.append(c);
			}
		user.setCode(sb.toString());
		ActionContext.getContext().getSession().put("activecode", sb.toString().trim());
		try {
			//发送激活邮件
			Properties props = new Properties();
			props.load(this.getClass().getClassLoader().getResourceAsStream("email_template.properties"));
			String host = props.getProperty("host");
			String uname = props.getProperty("uname");
			String pwd = props.getProperty("pwd");
			String from = props.getProperty("from");
			String to = user.getEmail();
			String subject = props.getProperty("subject");
			String content = props.getProperty("content");
			content = MessageFormat.format(content,user.getCode());
			Session session = MailUtils.createSession(host, uname, pwd);
			Mail mail = new Mail(from,to,subject,content);
			try {
				MailUtils.send(session, mail);
				HttpServletResponse response = ServletActionContext.getResponse();
				response.setContentType("text/html;charset=UTF-8");
				response.getWriter().println("<font color='red'>发送成功</font>");
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return NONE;
	}

	//ajax检验邮箱是否注册过
	public String checkEmail() throws IOException {
		User existUser = userService.findByEmail(user.getEmail());
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser == null) {
			//没有该用户
				response.getWriter().println("<font color='green'>邮箱可用</font>");
			} else {
				response.getWriter().println("<font color='red'>邮箱已存在</font>");
			}
		return NONE;
	}
	
	/**
	 * 退出
	 */
	public String quit(){
		// 销毁session
		ServletActionContext.getRequest().getSession().removeAttribute("exitsUser");
		return "quit";
	}
	

	//跳转到我的Q淘
	public String myqtao() {
		
		return "myqtao";
	}
	//保存修改用户资料
	public String updateUser() {
		User exitesUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		if(exitesUser != null) {
			if(user.getBirthday() != null && !user.getBirthday().equals(exitesUser.getBirthday())) {
				exitesUser.setBirthday(user.getBirthday());
			}
			if(user.getGender() != null && !user.getGender().equals(exitesUser.getGender())) {
				exitesUser.setGender(user.getGender());
			}
			if(user.getName() != null && !user.getName().equals(exitesUser.getName())) {
				exitesUser.setName(user.getName());
			}
			if(user.getNickname() != null && !user.getNickname().equals(exitesUser.getNickname())) {
				exitesUser.setNickname(user.getNickname());
			}
			if(user.getResidence() != null && !user.getResidence().equals(exitesUser.getResidence())) {
				exitesUser.setResidence(user.getResidence());
			}
			
			userService.update(exitesUser);
			this.addActionMessage("修改用户信息成功！");
		}
		
		return "updateUser";
	}
	//跳转到填写邮箱页
	public String findPassword() {
		
		return "findpassword";
	}
	public String sendEmailfindpassword() {
		//根据email查找用户是否存在
		User emailUser = userService.findByEmail(user.getEmail());
		if(emailUser == null) {
			this.addActionMessage("email不存在");
			return "findpassword";
		}else{
			String words =  "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890";
			Random random = new Random();
			StringBuffer sb = new StringBuffer();
			for (int i = 0; i < 6; i++) {
				int index = random.nextInt(words.length()); 
				char c = words.charAt(index);
				sb.append(c);
				}
			emailUser.setCode(sb.toString());
			userService.update(emailUser);
			ActionContext.getContext().getSession().put("activecode", sb.toString().trim());
			try {
				//发送激活邮件
				Properties props = new Properties();
				props.load(this.getClass().getClassLoader().getResourceAsStream("password_email.properties"));
				String host = props.getProperty("host");
				String uname = props.getProperty("uname");
				String pwd = props.getProperty("pwd");
				String from = props.getProperty("from");
				String to = user.getEmail();
				String subject = props.getProperty("subject");
				String content = props.getProperty("content");
				content = MessageFormat.format(content,emailUser.getUid(),emailUser.getCode());
				Session session = MailUtils.createSession(host, uname, pwd);
				Mail mail = new Mail(from,to,subject,content);
				try {
					MailUtils.send(session, mail);
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		this.addActionMessage("发送邮件成功，请到邮箱重置密码!");
		return "msg";
	}

	//跳转重置密码页
	public String resetpassword() {
		User emailUser = userService.findByUid(user.getUid());
		String code = (String) ServletActionContext.getRequest().getSession().getAttribute("activecode");
		if(code != null && emailUser != null) {
			if(code.equals(emailUser.getCode())) {
				ServletActionContext.getRequest().setAttribute("uid", emailUser.getUid());
				return "resetpassword";
			}
		}
		this.addActionMessage("该邮件已经重置过密码，请重新发送");
		return "msg";
	}
	//提交重置密码
	public String submitpassword() {
		User resetUser = userService.findByUid(user.getUid());
		if(resetUser != null) {
			resetUser.setPassword(user.getPassword());
			resetUser.setCode(null);
			userService.update(resetUser);
			return "loginPage";
		}
		this.addActionMessage("哎呀，出问题了，重试一下");
		return "msg";
	}
}
