package cn.itcast.shop.category.service;

import java.util.List;

import cn.itcast.shop.category.dao.CategoryDao;
import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.utils.PageBean;

public class CategoryService {
	private CategoryDao categoryDao;

	public void setCategoryDao(CategoryDao categoryDao) {
		this.categoryDao = categoryDao;
	}

	public List<Category> findAll() {

		return categoryDao.find();
	}

	public PageBean<Category> findByPage(Integer page) {
		PageBean<Category> pageBean = new PageBean<Category>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = categoryDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit ==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount /limit+1;
		}
		
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<Category> list = categoryDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public Category findByCid(Integer cid) {
		return categoryDao.findByCid(cid);
		
	}

	public void update(Category category) {
		categoryDao.update(category);
	}
	
	//保存二级菜单
	public void saveCategory(Category category) {
		categoryDao.saveCategory(category);
	}

	public List<Category> findByCids(int begin, int end) {
		// TODO Auto-generated method stub
		return categoryDao.findByCids(begin,end);
	}
	
}
