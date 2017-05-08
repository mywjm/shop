package cn.itcast.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.order.domain.Comment;


public class CommentDao extends HibernateDaoSupport{

	public Comment findByoid(Integer oid) {
		String sql = "from Comment where order.oid = ?";
		List<Comment> list = this.getHibernateTemplate().find(sql,oid);
		if(list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	
	
}
