package cn.itcast.shop.order.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.cart.domain.Cart;
import cn.itcast.shop.cart.domain.CartItem;
import cn.itcast.shop.order.domain.Comment;
import cn.itcast.shop.order.domain.Order;
import cn.itcast.shop.order.domain.OrderItem;
import cn.itcast.shop.order.service.CommentService;
import cn.itcast.shop.order.service.OrderService;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.user.domain.Address;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.AddressService;
import cn.itcast.shop.utils.PageBean;
import cn.itcast.shop.utils.PaymentUtil;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class OrderAction extends ActionSupport implements ModelDriven<Order> {

	private Order order = new Order();
	private OrderService orderService;
	private Integer pid;
	private Integer itemid;
	private Integer count;
	private ProductService productService;
	private AddressService addressService;
	private Integer aid;
	
	public void setAid(Integer aid) {
		this.aid = aid;
	}

	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}

	public Integer getItemid() {
		return itemid;
	}

	public void setItemid(Integer itemid) {
		this.itemid = itemid;
	}

	// 接收支付通道编码:
	private String pd_FrpId;

	public void setPd_FrpId(String pd_FrpId) {
		this.pd_FrpId = pd_FrpId;
	}

	// 接收付款成功后的参数:
	private String r3_Amt;
	private String r6_Order;

	public void setR3_Amt(String r3_Amt) {
		this.r3_Amt = r3_Amt;
	}

	public void setR6_Order(String r6_Order) {
		this.r6_Order = r6_Order;
	}

	public Order getOrder() {
		return order;
	}

	private double pagetotal;
	private int page;

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public double getPagetotal() {
		return pagetotal;
	}

	public void setPagetotal(double pagetotal) {
		this.pagetotal = pagetotal;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Integer getPid() {
		return pid;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public void setOrder(Order order) {
		this.order = order;
	}
	//评论service
	private CommentService commentService;
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	//保存评论
	private Map<Integer,Integer> map;

	public Map<Integer, Integer> getMap() {
		return map;
	}

	public void setMap(Map<Integer, Integer> map) {
		this.map = map;
	}

	//查找地址
	public void findAddress() {
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("exitsUser");
		if (user == null) {
			this.addActionError("请登录");
		}
		//根据uid查找地址表
		List<Address> address = addressService.findByUid(user.getUid());
		if(address != null && address.size() > 0) {
			ServletActionContext.getContext().getSession().put("address", address);
		}else{
			List<Address> address1 = new ArrayList<Address>();
			ServletActionContext.getContext().getSession().put("address", address1);
		}
		
	}
	
	//立即购买保存订单表
	public String bey() {
		this.findAddress();
		Product product = productService.findByPid(pid);
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("exitsUser");
		order.setState(1);
		order.setOrdertime(new Date());
		order.setUser(user);
		order.setTotal(product.getShop_price()*count);
		
		OrderItem orderItem = new OrderItem();
		orderItem.setCount(count);
		orderItem.setProduct(product);
		orderItem.setSubtotal(product.getShop_price()*count);
		orderItem.setOrder(order);
		
		order.getOrderItems().add(orderItem);
		orderService.save(order);
		ServletActionContext.getRequest().getSession()
		.setAttribute("order", order);
		return "bey";
	}
	
	// 购物车提交并保存到数据库
	public String submit() {
		this.findAddress();
		Cart cart = (Cart) ServletActionContext.getRequest().getSession()
				.getAttribute("cart");
		if (cart.getCartItems() == null && cart.getCartItems().size() <= 0) {
			this.addActionMessage("亲，您还没购物");
			return "msg";
		}
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("exitsUser");
		if (user == null) {
			this.addActionMessage("亲，请登录后购物");
			return "msg";
		}
		order.setState(1);
		order.setOrdertime(new Date());
		order.setUser(user);
		order.setTotal(cart.getTotal());
		Address address = addressService.findByAid(aid);
		order.setAddress(address);
		for (CartItem cartItem : cart.getCartItems()) {
			OrderItem orderItem = new OrderItem();
			orderItem.setCount(cartItem.getCount());
			orderItem.setProduct(cartItem.getProduct());
			orderItem.setSubtotal(cartItem.getSubtotal());
			orderItem.setOrder(order);
			order.getOrderItems().add(orderItem);
		}
		orderService.save(order);
		Cart cart1 = new Cart();
		ServletActionContext.getRequest().getSession()
				.setAttribute("cart", cart1);
		ActionContext.getContext().getValueStack()
		.set("order", order);
		return "submit";
	}
	//去支付
	public String gotoPay() {
		this.findAddress();
		Order currorder = orderService.findByOid(order.getOid());
		ActionContext.getContext().getValueStack()
		.setValue("order", currorder);
		return "gotoPay";
	}

	// 支付
	public String payOrder() throws IOException {
		if (order.getOid() != null) {
			Order currOrder = orderService.findByOid(order.getOid());
			Address address = addressService.findByAid(aid);
			currOrder.setAddress(address);
			// 修改订单
			orderService.update(currOrder);
			// 完成付款
			// 付款需要的参数
			String p0_Cmd = "Buy"; // 业务类型:
			String p1_MerId = "10001126856";// 商户编号:
			String p2_Order = order.getOid().toString();// 订单编号:
			String p3_Amt = "0.01"; // 付款金额:
			String p4_Cur = "CNY"; // 交易币种:
			String p5_Pid = ""; // 商品名称:
			String p6_Pcat = ""; // 商品种类:
			String p7_Pdesc = ""; // 商品描述:
			String p8_Url = "http:// 110.65.100.94:8080/shop/order_callBack.action"; // 商户接收支付成功数据的地址:
			String p9_SAF = ""; // 送货地址:
			String pa_MP = ""; // 商户扩展信息:
			String pd_FrpId = this.pd_FrpId;// 支付通道编码:
			String pr_NeedResponse = "1"; // 应答机制:
			String keyValue = "69cl522AV6q613Ii4W6u8K6XuW8vM1N6bFgyv769220IuYe9u37N4y7rI4Pl"; // 秘钥
			String hmac = PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt,
					p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP,
					pd_FrpId, pr_NeedResponse, keyValue); // hmac
			// 向易宝发送请求:
			StringBuffer sb = new StringBuffer("https://www.yeepay.com/app-merchant-proxy/node?");
			sb.append("p0_Cmd=").append(p0_Cmd).append("&");
			sb.append("p1_MerId=").append(p1_MerId).append("&");
			sb.append("p2_Order=").append(p2_Order).append("&");
			sb.append("p3_Amt=").append(p3_Amt).append("&");
			sb.append("p4_Cur=").append(p4_Cur).append("&");
			sb.append("p5_Pid=").append(p5_Pid).append("&");
			sb.append("p6_Pcat=").append(p6_Pcat).append("&");
			sb.append("p7_Pdesc=").append(p7_Pdesc).append("&");
			sb.append("p8_Url=").append(p8_Url).append("&");
			sb.append("p9_SAF=").append(p9_SAF).append("&");
			sb.append("pa_MP=").append(pa_MP).append("&");
			sb.append("pd_FrpId=").append(pd_FrpId).append("&");
			sb.append("pr_NeedResponse=").append(pr_NeedResponse).append("&");
			sb.append("hmac=").append(hmac);
			
			// 重定向:向易宝出发:
			ServletActionContext.getResponse().sendRedirect(sb.toString());
			return NONE;
		}
		this.addActionError("订单异常");
		return "myOrders";
	}

	// 付款成功后跳转回来的路径
	public String callBack() {
		// 修改订单的状态:
		Order currOrder = orderService.findByOid(Integer.parseInt(r6_Order));
		// 修改订单状态为2:已经付款:
		currOrder.setState(2);

		orderService.update(currOrder);
		this.addActionMessage("支付成功!订单编号为: " + r6_Order + " 付款金额为: " + r3_Amt);
		return "msg";
	}

	public Order getModel() {
		return order;
	}

	// 删除订单项
	public String deleteOrderItem() {
		int count = orderService.CountOrderItems(order.getOid());
		if (count > 1) {
			OrderItem orderItem = orderService.findByItemid(this.getItemid(),
					order.getOid());
			// 删除
			if (orderItem != null) {
				orderService.delete(orderItem);
			}
		} 
		if (count == 1) {
			OrderItem orderItem = orderService.findByItemid(this.getItemid(),
					order.getOid());
			Order order1 = orderService.findByOid(order.getOid());
			// 删除
			if (orderItem != null) {
				orderService.delete(orderItem);
				orderService.delete(order1);
				
			}
		}

		return "delete";
	}
	//删除支付页面的订单项
	public String deleteItem() {
		int count = orderService.CountOrderItems(order.getOid());
		if (count > 1) {
			OrderItem orderItem = orderService.findByItemid(this.getItemid(),
					order.getOid());
			// 删除
			if (orderItem != null) {
				orderService.delete(orderItem);
			}
		} 
		if (count == 1) {
			OrderItem orderItem = orderService.findByItemid(this.getItemid(),
					order.getOid());
			Order order1 = orderService.findByOid(order.getOid());
			// 删除
			if (orderItem != null) {
				orderService.delete(orderItem);
				orderService.delete(order1);
				
			}
		}
		
		return "deleteItem";
	}

	// 全部订单
	public String findAll() {
		if(page==0) {
			page = 1;
		}
		// 是否登陆
		User user = (User) ServletActionContext.getRequest().getSession()
				.getAttribute("exitsUser");
		if (user == null) {
			this.addActionMessage("请登录");
			return "mss";
		}
		
		PageBean<Order> pageBean = (PageBean<Order>) orderService.findByUid(
				user.getUid(), page);
		if (pageBean.getList() != null && pageBean.getList().size() > 0) {
			
			map = new HashMap<Integer, Integer>();
			for (Order order : pageBean.getList()) {
				pagetotal += order.getTotal();
				Comment comment = commentService.findByoid(order.getOid());
				if(comment == null && order.getState() == 4) {
					map.put(order.getOid(), 0);
				}
			}
			ActionContext.getContext().getValueStack().set("m", map);
			ActionContext.getContext().getValueStack()
					.set("pageBean", pageBean);
			return "findAll";
		} else {
			PageBean<Order> pageBean1 = new PageBean<Order>();
			pageBean1.setTotalPage(0);
			pageBean1.setPage(1);
			ActionContext.getContext().getValueStack()
					.set("pageBean", pageBean1);
			return "findAll";
		}
		

	}

	// 修改订单的状态:
	public String updateState() {
		Order currOrder = orderService.findByOid(order.getOid());
		currOrder.setState(4);
		orderService.update(currOrder);
		return NONE;
	}
	
	//删除订单
	public String deleteOrder(){
		List<OrderItem> orderItems = orderService.findOrderItems(order.getOid());
		if(orderItems!=null && orderItems.size()>0){
			for( OrderItem orderItem : orderItems){
				orderService.delete(orderItem);
			}
			Order order2 = orderService.findByOid(order.getOid());
			orderService.delete(order2);
		}
		return "delete";
	}
	
	//跳转到商品评论
	public String toComment() {
		Order commentOrder = orderService.findByOid(order.getOid());
		ServletActionContext.getContext().getValueStack().set("corder", commentOrder);
		return "toComment";
	}

}
