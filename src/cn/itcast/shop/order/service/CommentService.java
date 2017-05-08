package cn.itcast.shop.order.service;

import cn.itcast.shop.order.dao.CommentDao;
import cn.itcast.shop.order.domain.Comment;

public class CommentService {
	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}
	
	//根据oid查评论
	public Comment findByoid(Integer oid) {
		
		return commentDao.findByoid(oid);
	}
	
}
