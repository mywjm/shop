package cn.itcast.shop.product.adminAction;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.adminuser.domain.AdminUser;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.categorythird.service.CategoryThirdService;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.utils.PageBean;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AdminProductAction extends ActionSupport implements ModelDriven<Product>{
	Product product = new Product();
	public Product getModel() {
		// TODO Auto-generated method stub
		return product;
	}
	private Integer page;
	public void setPage(Integer page) {
		this.page = page;
	}
	private Integer ctid;
	

	public void setCtid(Integer ctid) {
		this.ctid = ctid;
	}
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	private CategoryThirdService categoryThirdService;
	
	public void setCategoryThirdService(CategoryThirdService categoryThirdService) {
		this.categoryThirdService = categoryThirdService;
	}
	private CategorySecondService categorySecondService;
	
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	//上传图片所用
	private File picture;
	private String pictureFileName;
	private String pictureContentType;
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public String getPictureFileName() {
		return pictureFileName;
	}
	public void setPictureFileName(String pictureFileName) {
		this.pictureFileName = pictureFileName;
	}
	public String getPictureContentType() {
		return pictureContentType;
	}
	public void setPictureContentType(String pictureContentType) {
		this.pictureContentType = pictureContentType;
	}
	private String keyWord;
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	//查询所有商品
	public String findAll(){
		if(page == null){
			page = 1;
		}
		PageBean<Product> pageBean = productService.findByPage(page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findAll";
	}
	//跳转到修改页面
	public String edit(){
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			product = productService.findByPid(product.getPid());
			if(product!=null){
				ActionContext.getContext().getValueStack().set("p", product);
			}
			List<CategoryThird> list = categoryThirdService.findThird();
			if(list!=null && list.size() > 0){
				ActionContext.getContext().getValueStack().set("list", list);
			}
			return "edit";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "success";
		}
		
	}
	//更新
	public String update(){
		CategoryThird categoryThird = categoryThirdService.findByCtid(ctid);
		Product updateProduct = productService.findByPid(product.getPid());
		updateProduct.setCategoryThird(categoryThird);
		if(product.getIs_hot() != null) {
			updateProduct.setIs_hot(product.getIs_hot());
		}
		if(product.getMarket_price() != null) {
			updateProduct.setMarket_price(product.getMarket_price());
		}
		if(product.getPdate() != null) {
			updateProduct.setPdate(product.getPdate());
		}
		if(product.getPdesc() != null) {
			updateProduct.setPdesc(product.getPdesc());
		}
		if(product.getPname() != null) {
			updateProduct.setPname(product.getPname());
		}
		if(product.getShop_price() != null) {
			updateProduct.setShop_price(product.getShop_price());
		}
		productService.update(updateProduct);
		return "success";
	}
	
	
	//上传图片
	public String upload() {
		Product uploadproduct = productService.findByPid(product.getPid());
		String Path = uploadproduct.getImage();
		String picturename = Path.substring(Path.lastIndexOf("/")+1);
		String rootpath = Path.substring(0, Path.lastIndexOf("/")+1);
		try {
			String root = ServletActionContext.getServletContext().getRealPath(rootpath);
			InputStream is = new FileInputStream(picture);
			OutputStream os = new FileOutputStream(new File(root, picturename));
			//下载
	        resizeImage(is, os, pictureFileName.substring(pictureFileName.indexOf(".")+1));
	      
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	
	}
	//修改图片大小和保存
	public void resizeImage(InputStream is, OutputStream os, String format) throws IOException {  
	    BufferedImage prevImage = ImageIO.read(is);  
	    int newWidth = 220;  
	    int newHeight = 220;  
	    BufferedImage image = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_BGR);  
	    Graphics graphics = image.createGraphics();  
	    graphics.drawImage(prevImage, 0, 0, newWidth, newHeight, null);  
	    ImageIO.write(image, format, os);  
	    os.flush();  
	    is.close();  
	    os.close();  
	}
	
	//跳转添加商品
	public String toadd() {
		AdminUser existAdminUser = (AdminUser) ServletActionContext.getRequest().getSession().getAttribute("existAdminUser");
		if(existAdminUser!=null){
			ServletActionContext.getResponse().setCharacterEncoding("utf-8");
			List<CategoryThird> list = categoryThirdService.findThird();
			if(list!=null && list.size() > 0){
				ActionContext.getContext().getValueStack().set("list", list);
			}
			return "toadd";
		}else{
			this.addActionMessage("游客无法修改内容!请登录后修改！");
			return "success";
		}
	}
	
	//添加商品
	public String add() {
		CategoryThird ct = categoryThirdService.findByCtid(ctid);
		CategorySecond cs = categorySecondService.findByCsid(ct.getCategorySecond().getCsid());
		String rootimage = null;
		try {
			String root = ServletActionContext.getServletContext().getRealPath("products");
			rootimage = root +"\\"+cs.getCategory().getCid()+"\\"+cs.getCsid()+"\\"+ct.getCtid()+"\\";
			InputStream is = new FileInputStream(picture);
			OutputStream os = new FileOutputStream(new File(rootimage, pictureFileName));
			//下载
	        resizeImage(is, os, pictureFileName.substring(pictureFileName.indexOf(".")+1));
	        String imagepath = "products" +"\\"+cs.getCategory().getCid()+"\\"+cs.getCsid()+"\\"+ct.getCtid()+"\\"+pictureFileName;
	        product.setCategoryThird(ct);
	        product.setImage(imagepath);
	        productService.saveProduct(product);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}
	
	//搜索处理
	public String SearchWord() {
		if(page == null) {
			page = 1;
		}
		PageBean<Product> pageBean = productService.searchByKeyword(keyWord,page);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("keyWord", keyWord);
		return "SearchWord";
	}
	
}
