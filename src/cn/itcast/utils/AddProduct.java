package cn.itcast.utils;

import java.io.File;
import java.util.Date;

import org.junit.Test;
import org.apache.commons.codec.digest.DigestUtils;

import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.product.dao.ProductDao;
import cn.itcast.shop.product.domain.Product;

public class AddProduct {
	
	ProductDao pr = new ProductDao();
	@Test
	public void test(){
//		String ss = this.getClass().getClassLoader().getResource("").getPath();
		File srcFile = new File("E:\\Workspaces\\MyPro\\ssh\\WebRoot\\products\\2\\男鞋");
//		System.out.println(ss);
		this.getAllJavaFilePaths(srcFile);
	}
	
	
	public  void getAllJavaFilePaths(File srcFolder) {
		// 获取该目录下所有的文件或者文件夹的File数组
		File[] fileArray = srcFolder.listFiles();
		// 遍历该File数组，得到每一个File对象
		
		int i = 0;
		for (File file : fileArray) {
			// 判断该File对象是否是文件夹
			if (file.isDirectory()) {
				getAllJavaFilePaths(file);
			} else {
				// 继续判断是否以.java结尾
				if (file.getName().endsWith(".jpg")) {
					//File oldfile=new File(file.getPath()); 
		           // File newfile=new File(file.getParent()+"/"+"cs"+(i++)+".jpg"); 
					// 就输出该文件的绝对路径
					String s = file.getPath().substring(file.getPath().indexOf("products"));
					Product product = new Product();
					product.setPname("男鞋"+i++);
					product.setIs_hot(0);
					product.setMarket_price(153.0+i++);
					product.setShop_price(120.3+(i++)*0.8);
					product.setImage(s);
					product.setPdate(new Date());
					product.setPdesc("最新的最潮的韩款男鞋跑鞋登山鞋工装鞋");
					CategorySecond cs = new CategorySecond();
					cs.setCsid(11);
//					product.setCategorySecond(cs);
					
					System.out.println(s);
					System.out.println(product.toString()+cs.getCsid());
		           // oldfile.renameTo(newfile);
		            
					
				}
			}
		}
	}

	//测试加密
	@Test
	public void md5Test() {
		String ss = "123456";
		System.out.println(DigestUtils.md5Hex(ss.getBytes()));
		System.out.println(	DigestUtils.md5(ss.getBytes()).toString());
		System.out.println(	DigestUtils.shaHex(ss));
		System.out.println(	DigestUtils.md5(ss));
		
		
		
	}

}
