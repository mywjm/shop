package cn.itcast.shop.user.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.user.domain.Favorites;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.FavoritesService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class FavoritesAction extends ActionSupport implements ModelDriven<Favorites> {
	
	private FavoritesService favoritesService;

	public void setFavoritesService(FavoritesService favoritesService) {
		this.favoritesService = favoritesService;
	}
	private Favorites favorites = new Favorites();
	private Integer pid;
	public void setPid(Integer pid) {
		this.pid = pid;
	}
	private ProductService productService;
	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	//添加到收藏夹
	public String addFavorites() {
//		favoritesService.addFavorites(favorites);
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		//根据uid 和 pid 查询是否收藏过
		Favorites exitfavorites = favoritesService.findFavorites(user.getUid(), pid);
		if(exitfavorites == null) {
			Product product = productService.findByPid(pid);
			if(user != null) {
				favorites.setUser(user);
				favorites.setProduct(product);
				favoritesService.addFavorites(favorites);
				try {
					HttpServletResponse response = ServletActionContext.getResponse();
					response.setCharacterEncoding("UTF-8");
					response.getWriter().write("<font color='red' disable='disable'>添加收藏夹成功</font>");
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		return NONE;
	}

	public Favorites getModel() {
		// TODO Auto-generated method stub
		return favorites;
	}
	
	//我的收藏夹
	public String MyFavorites() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		List<Favorites> favoriteslist = favoritesService.findByUid(user.getUid());
		ServletActionContext.getRequest().getSession().setAttribute("flist", favoriteslist);
		return "myfavorites";
	}
	
	//删除收藏夹
	public String delete() {
		User user = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		Favorites exiteFavorites = favoritesService.findFavorites(user.getUid(), pid);
		if (exiteFavorites != null) {
			favoritesService.delete(exiteFavorites);
		}
		
		return "delete";
	}
}
