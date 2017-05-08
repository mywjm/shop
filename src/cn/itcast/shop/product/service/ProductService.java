package cn.itcast.shop.product.service;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.search.FullTextQuery;
import org.hibernate.search.FullTextSession;
import org.hibernate.search.Search;
import org.hibernate.search.query.dsl.QueryBuilder;

import cn.itcast.shop.product.dao.ProductDao;
import cn.itcast.shop.product.domain.Product;
import cn.itcast.shop.utils.PageBean;

public class ProductService {

	private ProductDao productDao;

	public void setProductDao(ProductDao productDao) {
		this.productDao = productDao;
	}

	public List<Product> findHot(int begin) {
		
		return productDao.findHot(begin);
	}

	public List<Product> findNew(int begin, int limit) {
		
		return productDao.findNew(begin, limit);
	}

	public Product findByPid(Integer pid) {
		// TODO Auto-generated method stub
		return productDao.findByPid(pid);
	}
	// 根据二级分类查询商品信息
	public PageBean<Product> findByPageCsid(Integer csid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 36;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = productDao.findCountCsid(csid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage=0;
		if(totalCount%limit==0){
			totalPage = totalCount/limit;
		}else{
			totalPage = totalCount/limit+1;
		}
		
		pageBean.setTotalPage(totalPage);
		
		//每页显示的数据集合
		int begin = (page - 1)*limit;
		
		List<Product> list = productDao.findByPageCsid(csid,begin,limit);
		pageBean.setList(list);
		return pageBean;
	}
	//根据一级分类的cid和分页查询商品
	public PageBean<Product> findByPageCid(Integer cid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 36;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = productDao.findCountCid(cid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		
		pageBean.setTotalPage(totalPage);
		//每页显示的数据集合
		int begin = (page - 1) * limit;
		
		List<Product> list = productDao.findByPageCid(cid,begin,limit);
		pageBean.setList(list);
		
		return pageBean;
	}
	public void saveProduct(Product product){
		productDao.saveProduct(product);
	}

	public PageBean<Product> findByPage(Integer page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		pageBean.setPage(page);
		int limit = 30;
		pageBean.setLimit(limit);
		int totalCount = 0;
		totalCount = productDao.findCount();
		pageBean.setTotalCount(totalCount);
		
		int totalPage = 0;
		if(totalCount % limit ==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount /limit+1;
		}
		
		pageBean.setTotalPage(totalPage);
		int begin = (page-1)*limit;
		List<Product> list = productDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

	public void update(Product product) {
		productDao.update(product);
		
	}
	//根据特殊值查找特殊商品
	public List<Product> findByHot(int hot) {
		
		return productDao.findByHot(hot);
	}
	//根据三级菜单ctid查找所有商品
	public List<Product> findByCtid(int ctid) {
		return  productDao.findByCtid(ctid);
	}
	
	//根据ctid查找所有产品
	public PageBean<Product> findByPageCtid(int ctid, int page) {
		PageBean<Product> pageBean = new PageBean<Product>();
		//设置当前页数
		pageBean.setPage(page);
		//设置每页显示记录数
		int limit = 36;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount = 0;
		totalCount = productDao.findCountCtid(ctid);
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		
		pageBean.setTotalPage(totalPage);
		//每页显示的数据集合
		int begin = (page - 1) * limit;
		
		List<Product> list = productDao.findByPageCtid(ctid,begin,limit);
		pageBean.setList(list);
		
		return pageBean;
	}
	private SessionFactory sessionFactory;
	public void setSessionFactory(SessionFactory sessionFactory) {
	this.sessionFactory = sessionFactory;
}
	//根据关键字和当前页码查询匹配商品
	public PageBean<Product> searchByKeyword(String keyword, Integer pageNo) {
		//通过当前事务的Session获取FullTextSession对象
		FullTextSession fts = Search.getFullTextSession(sessionFactory.openSession());
		//获取特定类的特定QueryBuilder对象
		QueryBuilder qb = fts.getSearchFactory().buildQueryBuilder().forEntity(Product.class).get();
		//得到search query
		org.apache.lucene.search.Query luceneQuery = qb.keyword().onFields("pname").matching(keyword).createQuery();
		FullTextQuery query = fts.createFullTextQuery(luceneQuery, Product.class);
		//分页类
		PageBean<Product> pageBean = new PageBean<Product>();
		//分页信息
		int limit = 36;
		pageBean.setLimit(limit);
		pageBean.setPage(pageNo);
		
		int totalCount = 0;
		totalCount = query.getResultSize();
		pageBean.setTotalCount(totalCount);
		//设置总页数
		int totalPage = 0;
		if(totalCount % limit==0){
			totalPage = totalCount / limit;
		}else{
			totalPage = totalCount / limit +1;
		}
		
		pageBean.setTotalPage(totalPage);
		
		int begin = (pageNo - 1) * limit;
	
		//分页查询
		query.setFirstResult(begin);
		query.setMaxResults(limit);
		List<Product> list = query.list();
		List<Product> list1 = new ArrayList<Product>();
		for(Product product : list) {
			if(product.getIs_hot() < 2) {
				list1.add(product);
			}
		}
		//封装分页数据
		pageBean.setList(list1);
		    
		return pageBean;
	}
	
}
