package com.erunjrun.comment.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.erunjrun.comment.dao.CommentDAO;
import com.erunjrun.comment.dto.CommentDTO;

@Service
public class CommentService {
	
	Logger logger = LoggerFactory.getLogger(getClass());
	@Autowired CommentDAO commentDao;
	public List<CommentDTO> list(int board_idx) {
		
		return commentDao.list(board_idx);
	}
	public int addComment(int board_idx,String content, String nickname,HttpSession session) {
		String userId = (String) session.getAttribute("loginId");
		logger.info("받을 아이디? :"+userId);
		
		Map<String, Object> commPoint = new HashMap<String, Object>();
		commPoint.put("code_name", "P101");
        commPoint.put("id", userId);
        commPoint.put("point", 2);
        
        commentDao.commPoint(commPoint);
		
		return commentDao.addComment(board_idx,content,nickname);
	}
	public boolean update(CommentDTO commentDto) {
		
		return commentDao.update(commentDto) > 0;
	}
	public boolean delete(int comment_idx) {
		
		return commentDao.delete(comment_idx) > 0;
	}
	
}
