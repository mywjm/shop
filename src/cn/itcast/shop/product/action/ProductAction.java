package cn.itcast.shop.product.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.categorythird.service.CategoryThirdService;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.user.domain.Favorites;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.FavoritesService;
import cn.itcast.shop.utils.PageBean;
import cn.itcast.shop.utils.SaveSessionTool;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class ProductAction extends ActionSupport implements ModelDriven<Product>{
	private static final long serialVersionUID = 2873442984257313355L;
	private ProductService productService;
	private Product product = new Product();
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}
	private SaveSessionTool saveSessionTool;
	public void setSaveSessionTool(SaveSessionTool saveSessionTool) {
		this.saveSessionTool = saveSessionTool;
	}
	public Product getModel() {
		saveSessionTool.saveSession();
		return product;
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
	private Integer cid;
	private Integer csid;
	// categoryService

	//page
	private int page;
	private int ctid;
	
	public int getCtid() {
		return ctid;
	}

	public void setCtid(int ctid) {
		this.ctid = ctid;
	}




	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public void setPage(int page) {
		this.page = page;
	}

	private FavoritesService favoritesService;
	public void setFavoritesService(FavoritesService favoritesService) {
		this.favoritesService = favoritesService;
	}
	private String keyWord;
	
	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}
	/**
	 * 根据pid查找相应产品,商品详情页
	 * @return
	 */
	public String findByPid(){
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		if(user != null) {
			Favorites favorites =	favoritesService.findFavorites(user.getUid(), product.getPid());
			//没有收藏
			if(favorites == null) {
				ServletActionContext.getRequest().getSession().setAttribute("empty", 0);
			}else{
				ServletActionContext.getRequest().getSession().setAttribute("empty", 1);
			}
		}
		
		product = productService.findByPid(product.getPid());
		//热门推荐列表
		PageBean<Product> pageBean = productService.searchByKeyword(product.getCategoryThird().getCtname(),1);
		List<Product> list = new ArrayList<Product>();
		for(int i = 0; i<4; i++) {
			list.add(pageBean.getList().get(i));
		}
		ServletActionContext.getContext().getValueStack().set("list", list);
		return "findByPid";
	}
	/**
	 * 根据一级菜单cid查找下面所有的产品
	 * @return
	 */
	public String findByCid(){
		PageBean<Product> pageBean = productService.findByPageCid(cid,page);
		//添加到值栈中
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		//根据cid查找二级菜单
		List<CategorySecond> cslist = categorySecondService.findByCid(cid);
		ServletActionContext.getRequest().getSession().setAttribute("cslist", cslist);
		//根据当前的cid查找当前的标题
		Category category = categoryService.findByCid(cid);
		ActionContext.getContext().getValueStack().set("category", category);
		
		ActionContext.getContext().getValueStack().set("cid", cid);
		return "findByCid";
	}
	/**
	 * 根据二级菜单csid查找二级菜单下的所有产品
	 * @return
	 */
	public String findByCsid(){
		PageBean<Product> pageBean = productService.findByPageCsid(csid,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		ActionContext.getContext().getValueStack().set("csid", csid);
	
		//根据csid查找三级菜单
		List<CategoryThird> ctlist = categoryThirdService.findByCsid(csid);
		ActionContext.getContext().getValueStack().set("ctlist", ctlist);
		//根据csid查当前的标题
		CategorySecond categorySecond = categorySecondService.findByCsid(csid);
		ActionContext.getContext().getValueStack().set("categorySecond", categorySecond);
		return "findByCsid";
	}
	/**
	 * 根据三级菜单ctid查找三级菜单下的所有产品
	 * @return
	 */
	public String findByCtid(){
		PageBean<Product> pageBean = productService.findByPageCtid(ctid,page);
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);

		//根据csid查找三级菜单
		List<CategoryThird> ctlist = categoryThirdService.findByCsid(csid);
		ActionContext.getContext().getValueStack().set("ctlist", ctlist);
		ActionContext.getContext().getValueStack().set("ctid", ctid);
		ActionContext.getContext().getValueStack().set("csid", csid);
		CategoryThird categorythird = categoryThirdService.findByCtid(ctid);
		ActionContext.getContext().getValueStack().set("categorythird", categorythird);
		return "findByCtid";
	}
	
	//跳转到一个维修中页面
	public String ToPage(){
		return "ToPage";
	}

	//搜索处理
	public String SearchKeyWord() {
		if(page == 0) {
			page = 1;
		}
		PageBean<Product> pageBean = productService.searchByKeyword(keyWord,page);
		ServletActionContext.getRequest().setAttribute("pageBean", pageBean);
		ServletActionContext.getRequest().setAttribute("keyWord", keyWord);
		return "SearchKeyWord";
	}
}
