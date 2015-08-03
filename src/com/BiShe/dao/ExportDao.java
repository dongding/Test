package com.BiShe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.BiShe.bean.Application;
import com.BiShe.db.ConnectionFactory;


public class ExportDao {
	public List<Application> gettableapplication(List<String> list1) {
		List<Application> list = null;
		try {
			SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			list = sqlSession.selectList("APPLICATION_INFO.gettableapplication", list1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

}
