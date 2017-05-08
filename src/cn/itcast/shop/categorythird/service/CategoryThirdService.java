package cn.itcast.shop.categorythird.service;

import java.util.List;

import cn.itcast.shop.category.domain.Category;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.categorythird.dao.CategoryThirdDao;
import cn.itcast.shop.categorythird.domain.CategoryThird;
import cn.itcast.shop.utils.PageBean;

public class CategoryThirdService {
	private CategoryThirdDao categoryThirdDao;

	public void setCategoryThirdDao(CategoryThirdDao categoryThirdDao) {
		this.categoryThirdDao = categoryThirdDao;
	}
	
	//保存三级菜单
	public void saveCategoryThird(CategoryThird categoryThird) {
		categoryThirdDao.save(categoryThird);
	}
	//根据csid查找三级菜单
	public List<CategoryThird> findByCsid(Integer csid) {
		// TODO Auto-generated method stub
		return categoryThirdDao.findByCsid(csid);
	}

	public CategoryThird findByCtid(int ctid) {
		// TODO Auto-generated method stub
		return categoryThirdDao.findByCtid(ctid);
	}

	public PageBean<CategorySecond> findByPage(Integer page) {
		PageBean<CategorySecond> pageBean = new PageBean<CategorySecond>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = categoryThirdDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0 ){
			totalPage = totalCount / limit;
			
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<CategorySecond> list = categoryThirdDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public List<CategorySecond> findAll() {
		return categoryThirdDao.findAll();
	}
	
	public List<CategoryThird> findThird() {
		return categoryThirdDao.findThird();
	}
	public void update(CategoryThird updatecategoryThird) {
		categoryThirdDao.update(updatecategoryThird);
		
	}
	
}
