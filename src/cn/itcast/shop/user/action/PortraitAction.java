package cn.itcast.shop.user.action;

import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import org.apache.struts2.ServletActionContext;

import cn.itcast.shop.user.domain.User;
import cn.itcast.shop.user.service.UserService;

import com.opensymphony.xwork2.ActionSupport;
//头像处理类
public class PortraitAction extends ActionSupport {
	private File portrait;
	private String portraitFileName;
	private String portraitContentType;
	private UserService userService;
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public String uploadPortrait() throws IOException {
		try {
			String root = ServletActionContext.getServletContext().getRealPath("/img/portrait/");
			InputStream is = new FileInputStream(portrait);
			User exitesUser = (User) ServletActionContext.getRequest().getSession().getAttribute("exitsUser");
			String filename = exitesUser.getNickname()+portraitFileName.substring(portraitFileName.indexOf("."));
			OutputStream os = new FileOutputStream(new File(root, filename));
	        
	        resizeImage(is, os, portraitFileName.substring(portraitFileName.indexOf(".")+1));
	        
/*	        while(-1 != (length = is.read(buffer, 0, buffer.length)))
	        {
	            os.write(buffer);
	        }
	        
	        os.close();
	        is.close();
	       */
	        this.addActionMessage("上传成功");
	        exitesUser.setPortrait("/img/portrait/"+filename);
	        userService.update(exitesUser);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "upload";
	}
	
	public void resizeImage(InputStream is, OutputStream os, String format) throws IOException {  
	    BufferedImage prevImage = ImageIO.read(is);  
//	    double width = prevImage.getWidth(null);  
//	    double height = prevImage.getHeight(null);  
//	    double percent = size/width;  
	    int newWidth = 43;  
	    int newHeight = 43;  
	    BufferedImage image = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_BGR);  
	    Graphics graphics = image.createGraphics();  
	    graphics.drawImage(prevImage, 0, 0, newWidth, newHeight, null);  
	    ImageIO.write(image, format, os);  
	    os.flush();  
	    is.close();  
	    os.close();  
	} 
	//跳转修改用户头像
	public String myportrait() {
		return "myportrait";
	}
	
	
	public File getPortrait() {
		return portrait;
	}
	public void setPortrait(File portrait) {
		this.portrait = portrait;
	}
	public String getPortraitFileName() {
		return portraitFileName;
	}
	public void setPortraitFileName(String portraitFileName) {
		this.portraitFileName = portraitFileName;
	}
	public String getPortraitContentType() {
		return portraitContentType;
	}
	public void setPortraitContentType(String portraitContentType) {
		this.portraitContentType = portraitContentType;
	}
}
