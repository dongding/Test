package com.BiShe.db;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public  class ConnectionFactory {
	  private static SqlSessionFactory sqlFactory = null;
	  

	    private ConnectionFactory() {
	    }
	    public static SqlSessionFactory getConnection() {
	        try {
	            if (sqlFactory == null) {
	                Reader reader = Resources
	                        .getResourceAsReader("mybatis.xml");
	                sqlFactory = new SqlSessionFactoryBuilder().build(reader);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }

	        return sqlFactory;
	    }
}
