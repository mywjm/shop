package cn.itcast.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.CacheMode;
import org.hibernate.FlushMode;
import org.hibernate.ScrollMode;
import org.hibernate.ScrollableResults;
import org.hibernate.Session;


import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.categorythird.service.CategoryThirdService;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.UserService;

import com.opensymphony.xwork2.ActionSupport;

public class HibernateTest extends ActionSupport{

	private static final long serialVersionUID = 8294698128846277843L;
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	private CategorySecondService categorySecondService;

	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	
	private CategoryThirdService categoryThirdService;
	
	public void setCategoryThirdService(CategoryThirdService categoryThirdService) {
		this.categoryThirdService = categoryThirdService;
	}
	File srcfile = null;
	BufferedReader br =null;
	List<String> list = new ArrayList<String>();
	CategorySecond categorySecond = null;
	Category category = null;
	CategoryThird categoryThird = null;
	
	//用户表的查询
	public String queryUser() {
		User user = new User();
		user.setNickname("tom");
		userService.save(user);
		return NONE;
	}
	//批量插入一级菜单
	public String insertCategory() {
		String ss = this.getClass().getClassLoader().getResource("category.txt").toString();
		String src = ss.substring(ss.indexOf("E")).replace("\\", "/");
		srcfile = new File(src);
		try {
			br = new BufferedReader(new FileReader(srcfile));
			String line = null;
			while((line=br.readLine()) != null) {
				Category category = new Category();
				category.setCname(line);
				categoryService.saveCategory(category);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(br!=null) {
					br.close();
					br = null;
				}
				}catch(Exception e){
					e.printStackTrace();
				}
		}
		return NONE;
	}
	
	
	//批量插入二级菜单
	public String insertCategorySecond() {
		String ss = this.getClass().getClassLoader().getResource("categorysecond.txt").toString();
		String src = ss.substring(ss.indexOf("E")).replace("\\", "/");
		srcfile = new File(src);
		try {
			br = new BufferedReader(new FileReader(srcfile));
			int i = 0;
			String line = null;
			String[] s1 = null;
			while((line=br.readLine()) != null) {
				s1 = line.split("\r\n");
				list.add(s1[0]);
				i++;
			}
			for(int j = 1; j<=i;j++) {
				if(j < 9 ) {
					 //女装男装
					insertCS(1,list.get(j-1));
				
					
				}else if(j>=9 && j<16) {
					//鞋类箱包
					insertCS(2,list.get(j-1));
				}else if(j>=16 && j<22) {
					//母婴用品
					insertCS(3,list.get(j-1));
				}else if(j>=22 && j<28) {
					//护肤彩妆
					insertCS(4,list.get(j-1));
				}else if(j>=28 && j<32) {
					//汇吃美食
					insertCS(5,list.get(j-1));
				}else if(j>=32 && j<38) {
					//珠宝配饰
					insertCS(6,list.get(j-1));
				}else if(j>=38 && j<43) {
					//家装建材
					insertCS(7,list.get(j-1));
				}else if(j>=43 && j<48) {
					//家居家纺
					insertCS(8,list.get(j-1));
		
				}else if(j>=48 && j<53) {
					//百货市场
					insertCS(9,list.get(j-1));
				}else if(j>=53 && j<58) {
					//汽车用品
					insertCS(10,list.get(j-1));
				}else if(j>=58 && j<64) {
					//手机数码
					insertCS(11,list.get(j-1));
				}else if(j>=64 && j<70) {
					//家电办公
					insertCS(12,list.get(j-1));
				}else if(j>=70 && j<75) {
					//图书音像
					insertCS(13,list.get(j-1));
				}else if(j>=75 && j<81) {
					//玩具乐器
					insertCS(14,list.get(j-1));
				}else if(j>=81 && j<91) {
					//运动户外
					insertCS(15,list.get(j-1));
				}else if(j>=91 && j<98) {
					//精装厨具
					insertCS(16,list.get(j-1));
				}else if(j>=98 && j<105) {
					//食品保健
					insertCS(17,list.get(j-1));
				}else{
					
					
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(br!=null) {
					br.close();
					br = null;
				}
				}catch(Exception e){
					e.printStackTrace();
				}
		}
		return NONE;
	}
	//插入二级菜单方法
	public void insertCS(Integer cid, String csname) {
		categorySecond = new CategorySecond();
		category = categoryService.findByCid(cid);
		categorySecond.setCategory(category);
		categorySecond.setCsname(csname);
		categorySecondService.saveCS(categorySecond);
	}
	
	//批量插入三级菜单
	public String insertCategoryThird() {
		String ss = this.getClass().getClassLoader().getResource("categorythird.txt").toString();
		String src = ss.substring(ss.indexOf("E")).replace("\\", "/");
		srcfile = new File(src);
		try {
			br = new BufferedReader(new FileReader(srcfile));
			String line = null;
			int k=1;
			String[] s1 = null;
			while((line = br.readLine()) != null) {
				System.out.println(line);
				s1 = line.split(" ");
				for(String s : s1) {
					insertCT(k,s);
				}
				k++;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(br!=null) {
					br.close();
					br = null;
				}
				}catch(Exception e){
					e.printStackTrace();
				}
		}
		return NONE;
	}
	
	
	//插入三级菜单方法
	public void insertCT(Integer csid, String ctname) {
		categoryThird = new CategoryThird();
		categoryThird.setCtname(ctname);
		categorySecond = categorySecondService.findByCsid(csid);
		categoryThird.setCategorySecond(categorySecond);
		categoryThirdService.saveCategoryThird(categoryThird);
	}
	
	
	
}
