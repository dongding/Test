package com.BiShe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.BiShe.bean.Comment;
import com.BiShe.db.ConnectionFactory;

public class CommentDAOImpl implements ICommentDAO{
	private SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
	private SqlSession sqlSession = null;

	@Override
	public List<Comment> getAllHistoryComments() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		List<Comment> list = sqlSession.selectList("COMMENTS_INFO.getallhistorycomments");
		sqlSession.close();
		return list;
	}

	@Override
	public List<Comment> getHistoryCommentsByDataId(int dataId) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		List<Comment> list = sqlSession.selectList("COMMENTS_INFO.gethistorycommentsbydataid",dataId);
		sqlSession.close();
		return list;
	}

	@Override
	public boolean insertComment(Comment c) {
		// TODO Auto-generated method stub
		
		sqlSession = sqlSessionFactory.openSession();
		int r = sqlSession.insert("COMMENTS_INFO.insertComment", c);
		if(r > 0){
			sqlSession.commit();
			sqlSession.close();
			return true;

		}
		sqlSession.rollback();
		sqlSession.close();
		return false;
	}

}
