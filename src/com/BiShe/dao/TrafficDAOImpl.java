package com.BiShe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.BiShe.bean.Application;
import com.BiShe.bean.Traffic;
import com.BiShe.db.ConnectionFactory;

public class TrafficDAOImpl implements ITrafficDAO{
	private SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
	private SqlSession sqlSession = null; 
	@Override
	public boolean updateByDataId(Traffic a) {
		
		sqlSession = sqlSessionFactory.openSession(); 
		int i = sqlSession.update("TRAFFIC_INFO.updatetrafficinfobydataid", a);
		if(i > 0){
			sqlSession.commit();
			sqlSession.close();
			return true;
		}else{
			sqlSession.rollback();
			sqlSession.close();
			return false;
		}
	}

	@Override
	public boolean insertTraffic(Traffic a) {
		
		sqlSession = sqlSessionFactory.openSession();
		int i = sqlSession.insert("TRAFFIC_INFO.inserttrafficinfo", a);
		if(i > 0){
			sqlSession.commit();
			sqlSession.close();
			return true;
			
		}else{
			sqlSession.rollback();
			sqlSession.close();
			return false;
		}
		
	}

	@Override
	public Traffic getTrafficById(int dataid) {
		sqlSession = sqlSessionFactory.openSession(); 
		Traffic a = sqlSession.selectOne("TRAFFIC_INFO.gettrafficbydataid", dataid);
		sqlSession.close();
		return a;
	}

	@Override
	public List<Traffic> getTrafficByEmpid(String empid) {
		sqlSession = sqlSessionFactory.openSession(); 
		List<Traffic> list = sqlSession.selectList("TRAFFIC_INFO.gettrafficbyempid",empid);
		sqlSession.close();
		return list;
	}
	

	
}
