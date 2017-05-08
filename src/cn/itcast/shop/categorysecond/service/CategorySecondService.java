package cn.itcast.shop.categorysecond.service;

import java.util.List;

import cn.itcast.shop.categorysecond.dao.CategorySecondDao;
import cn.itcast.shop.categorysecond.domian.CategorySecond;
import cn.itcast.shop.utils.PageBean;

public class CategorySecondService {
	private CategorySecondDao categorySecondDao;

	public void setCategorySecondDao(CategorySecondDao categorySecondDao) {
		this.categorySecondDao = categorySecondDao;
	}

	public PageBean<CategorySecond> findByPage(Integer page) {
		PageBean<CategorySecond> pageBean = new PageBean<CategorySecond>();
		pageBean.setPage(page);
		int limit = 10;
		pageBean.setLimit(limit);
		
		int totalCount = 0;
		totalCount = categorySecondDao.findCount();
		pageBean.setTotalCount(totalCount);
		int totalPage = 0;
		if(totalCount % limit == 0 ){
			totalPage = totalCount / limit;
			
		}else{
			totalPage = totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<CategorySecond> list = categorySecondDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public CategorySecond findByCsid(Integer csid) {
		
		return categorySecondDao.findCSByCsid(csid);
	}

	public void update(CategorySecond categorySecond) {
		categorySecondDao.update(categorySecond);
		
	}

	public List<CategorySecond> findAll() {
		// TODO Auto-generated method stub
		return categorySecondDao.findAll();
	}
	//保存二级菜单
	public void saveCS(CategorySecond categorySecond) {
		categorySecondDao.save(categorySecond);
	}
	//根据cid查找二级菜单
	public List<CategorySecond> findByCid(Integer cid) {
		// TODO Auto-generated method stub
		return categorySecondDao.findByCid(cid);
	}
	
	
}
