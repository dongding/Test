package com.BiShe.dao;

import java.util.List;

import com.BiShe.bean.Comment;

public interface ICommentDAO {
	List<Comment> getAllHistoryComments();
	List<Comment> getHistoryCommentsByDataId(int dataId);
	boolean insertComment(Comment c);
}
