package cn.itcast.shop.user.action;

import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.user.domain.Address;
import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.AddressService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class AddressAction extends ActionSupport implements ModelDriven<Address> {
	private Address address = new Address();
	private AddressService addressService; 
	public void setAddressService(AddressService addressService) {
		this.addressService = addressService;
	}
	public Address getModel() {
		// TODO Auto-generated method stub
		return address;
	}
	
	
	//跳转到我的地址
	public String myAddr() {
		User exitesUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		List<Address> address = addressService.findByUid(exitesUser.getUid());
		if(address != null && address.size() > 0) {
			ServletActionContext.getRequest().getSession().setAttribute("myAddr", address);
		}else{
			List<Address> address1 = new ArrayList<Address>();
			ServletActionContext.getRequest().getSession().setAttribute("myAddr", address1);
		} 
		
		return "myAddr";
	}
	
	//跳转到添加地址
	public String addAddress() {
		return "addAddress";
	}
	//添加
	public String add() {
		User exitesUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		if(exitesUser != null) {
			address.setUser(exitesUser);
			addressService.save(address);
		}
		return "add";
	}
	
	//删除
	public String delete() {
		Address delete_address = addressService.findByAid(address.getAid());
		if(delete_address != null) {
			addressService.delete(delete_address);
		}
		return "delete";
	}
	//跳转到更新页面
	public String toUpdate() {
		Address update_address = addressService.findByAid(address.getAid());
		if(update_address != null) {
			ServletActionContext.getRequest().getSession().setAttribute("update_address", update_address);
		}
		return "toUpdate";
	}
	//更新
	public String update() {
		addressService.update(address);
		return "update";
	}
	//删除全部
	public String deleteAll() {
		User exitesUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
		List<Address> address = addressService.findByUid(exitesUser.getUid());
		if(address != null && address.size() > 0) {
			for(Address addr : address) {
				addressService.delete(addr);
			}
		}
		return "deleteAll";
	}

}
