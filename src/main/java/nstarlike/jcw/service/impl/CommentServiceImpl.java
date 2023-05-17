package nstarlike.jcw.service.impl;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;

import nstarlike.jcw.model.Comment;
import nstarlike.jcw.model.CommentMap;
import nstarlike.jcw.service.CommentService;
import nstarlike.jcw.dao.CommentDao;

@Repository
public class CommentServiceImpl implements CommentService {
	private static final Logger logger = LoggerFactory.getLogger(CommentServiceImpl.class);
	private static final String PREFIX = "nstarlike.jcw.mapper.CommentMapper.";
	
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public int write(Comment comment) {
		logger.debug("start CommentServiceImpl.write");
		logger.debug("comment=" + comment);
		
		return commentDao.create(comment);
	}

	@Override
	public List<CommentMap> listAll(Map<String, String> params) {
		logger.debug("start CommentServiceImpl.listAll");
		logger.debug("params=" + params);
		
		return commentDao.readAll(params);
	}
	
	@Override
	public Comment getById(long id) {
		logger.debug("start CommentServiceImpl.getById");
		logger.debug("id=" + id);
		
		return commentDao.readById(id);
	}

	@Override
	public int delete(long id) {
		logger.debug("start CommentServiceImpl.delete");
		logger.debug("id=" + id);
		
		return commentDao.delete(id);
	}

}
