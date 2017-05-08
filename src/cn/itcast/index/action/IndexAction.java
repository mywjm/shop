package cn.itcast.index.action;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.utils.SaveSessionTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
public class IndexAction  extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private SaveSessionTool saveSessionTool;
	public void setSaveSessionTool(SaveSessionTool saveSessionTool) {
		this.saveSessionTool = saveSessionTool;
	}

	private ProductService productService;
	

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	
	public String index(){
		//保存菜单栏
		saveSessionTool.saveSession();
		//获取滚动图片
		List<Product> slist =  productService.findByHot(3);
		ServletActionContext.getRequest().setAttribute("slist", slist);
		//获取商标
		List<Product> logoList = productService.findByHot(4); 
		ActionContext.getContext().getValueStack().set("logoList", logoList);
		//获取热门商品
		List<Product> hList1 = productService.findHot(0);
		ActionContext.getContext().getValueStack().set("hList1", hList1);
		List<Product> hList2 = productService.findHot(16);
		ActionContext.getContext().getValueStack().set("hList2", hList2);
		//获取热卖促销
		List<Product> nList = productService.findByCtid(3);
		ActionContext.getContext().getValueStack().set("nList", nList);
		
		//潮流女包
		List<Product> List1 = productService.findByCtid(111);
		List<Product> nvbaolist = new ArrayList<Product>();
		//小米
		List<Product> List2 = productService.findByCtid(583);
		List<Product> yingyinlist = new ArrayList<Product>();
		//短外套
		List<Product> List3 = productService.findByCtid(10);
		List<Product> shoubiaolist = new ArrayList<Product>();
		
		
		//规范每个分类的长度
		for (int j = 0; j < 9; j++) {
			nvbaolist.add(List1.get(j));
			yingyinlist.add(List2.get(j));
			shoubiaolist.add(List3.get(j));
		}
		ActionContext.getContext().getValueStack().set("nvbaolist", nvbaolist);
		ActionContext.getContext().getValueStack().set("yingyinlist", yingyinlist);
		ActionContext.getContext().getValueStack().set("shoubiaolist", shoubiaolist);
		return "index";
	}
	//购物指南
	public String guidance() {
		return "guidance";
	}
	//退货
	public String returnGood() {
		return "returnGood";
	}
	//建议
	public String advice() {
		return "advice";
	}
	//关于
	public String aboutus() {
		return "aboutus";
	}
	//临时404页
	public String fourzfour() {
		
		return "fourzfour";
	}
	public String more() {
		List<Category> clist = saveSessionTool.getCategory();
		ActionContext.getContext().getValueStack().set("clist", clist);
		return "more";
	}
	
	
}
