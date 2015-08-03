package com.BiShe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.BiShe.bean.Note;
import com.BiShe.db.ConnectionFactory;

public class NoteDAOImpl implements INoteDAO {
	private SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
	private SqlSession sqlSession = null; 
	@Override
	public List<Note> getAllHistoryNotes() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		List<Note> list = sqlSession.selectList("NOTES_INFO.getallhistorynotes");
		sqlSession.close();
		return list;
	}
	@Override
	public List<Note> getHistoryNotesByDataId(int dataid) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		List<Note> list = sqlSession.selectList("NOTES_INFO.gethistorynotesbydataid",dataid);
		sqlSession.close();
		return list;
	}
	@Override
	public boolean insertNote(Note n) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		int i = sqlSession.insert("NOTES_INFO.insertNote", n);
		if(i>0){
			sqlSession.commit();
			sqlSession.close();
			return true;
		}else{
			sqlSession.rollback();
			sqlSession.close();
			return false;
			
		}
		
	}

}
