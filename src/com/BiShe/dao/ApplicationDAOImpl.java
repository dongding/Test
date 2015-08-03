package com.BiShe.dao;
import java.math.BigDecimal;
import java.text.DecimalFormat;
import java.util.List;
import java.util.StringTokenizer;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;


import com.BiShe.bean.Application;
import com.BiShe.bean.Employee;
import com.BiShe.db.ConnectionFactory;

public class ApplicationDAOImpl implements IApplicationDAO {
	
	private SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
	private SqlSession sqlSession = null; 
	@Override
	public List<Application> getApplicationByEmpid(String empid) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Application> list = sqlSession.selectList("APPLICATION_INFO.getapplicationbyempid",empid);
		sqlSession.close();
		return list;
	}

	@Override
	public Application getApplicationById(int dataid) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		Application a = sqlSession.selectOne("APPLICATION_INFO.getapplicationbydataid", dataid);
		sqlSession.close();
		return a;
	}

	@Override
	public boolean updateByDataId(Application a) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		int i = sqlSession.update("APPLICATION_INFO.updateapplicationinfobydataid", a);
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
	public int getMaxDataId() {
		// TODO Auto-generated method stub
		int i = 0;
		sqlSession = sqlSessionFactory.openSession(); 
		if(sqlSession.selectOne("APPLICATION_INFO.getmaxdataid")!=null){
			i = sqlSession.selectOne("APPLICATION_INFO.getmaxdataid");
		}		
		sqlSession.close();
	    return i;
	}

	@Override
	public boolean insertApplication(Application a) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		int i = sqlSession.insert("APPLICATION_INFO.insertapplicationinfo", a);
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
	public List<Application> getAllApplication() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Application> list = sqlSession.selectList("APPLICATION_INFO.getallapplication");
		sqlSession.close();
		return list;
	}

	@Override
	public List<Application> getApplicationByStatus() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Application> list = sqlSession.selectList("APPLICATION_INFO.getallapplicationByStatus");
		sqlSession.close();
		return list;
	}

    @Override
	public List<Application> getApplicationListForApprover(Employee e) {
		sqlSession = sqlSessionFactory.openSession(); 
		List<Application> list = sqlSession.selectList("APPLICATION_INFO.getapplicationsforapprover",e);
		sqlSession.close();
		return list;
	}


	@Override
	public boolean updateStatusAndUpdateDate(Application a) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		 int i = sqlSession.update("APPLICATION_INFO.updatestatusandupdate_date", a);
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
	public boolean updateRejectNotes(Application a) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		int i = sqlSession.update("APPLICATION_INFO.updaterejectnotes", a);
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
	public boolean updateComments(Application a) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		int i = sqlSession.update("APPLICATION_INFO.updatecomments", a);
		if(i > 0){
			sqlSession.commit();
			sqlSession.close();
			return true;
		}
		else{
			sqlSession.rollback();
			sqlSession.close();
		}
		return false;
	}
	

	@Override
	public boolean deleteApplicationByDataId(int dataId) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		int i = sqlSession.delete("APPLICATION_INFO.deleteapplicationbydataid", dataId);
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
	public boolean setApplicationCompanyCoverRate(Application a) {
		// TODO Auto-generated method stub
		
		double totalCost = this.stringParseDouble(a.getTotalCost());
		double companyCover = this.stringParseDouble(a.getCompanyCover());
		double companyCoverRate = companyCover/totalCost;
		
		BigDecimal bd = new BigDecimal(companyCoverRate);
		double result = bd.setScale(4, BigDecimal.ROUND_HALF_UP).doubleValue();
        result = result * 100.0;
        
		DecimalFormat format = new DecimalFormat();
		String s = format.format(result);
		s = s + " %";
		return true;
	}

	@Override
	public double stringParseDouble(String s) {
		// TODO Auto-generated method stub
		String str = s;
		StringTokenizer st = new StringTokenizer(str);
	    String result = "";
		while(st.hasMoreTokens()){
			result = result + st.nextToken(",");
		}
		result = result.trim();
		double d = Double.parseDouble(result);
	    return d;
	}

	@Override
	public boolean setAgreementCreateDate(Application a) {
		// TODO Auto-generated method stub
		String year;
		String month;
		String day;
		
		String updateDate= this.getFormatUpdateDate(a);
		String[] subString = updateDate.split("-");
		
		year=subString[0]; 
		month=subString[1]; 
		day=subString[2];
		a.setYearCn(year);
		a.setMonthCn(month);
		a.setDayCn(day);
		
		return true;
	}

	@Override
	public String getFormatUpdateDate(Application a) {
		// TODO Auto-generated method stub
		String updateDate= a.getUpdateDate();
		StringTokenizer st = new StringTokenizer(updateDate," ");
		String result = "";
		if(st.hasMoreTokens()){
			result = st.nextToken();
				
		}
		return result;
	}
	@Override
	public boolean setApplicationCompanyCoverCn(Application a) {
		// TODO Auto-generated method stub
		//a.setCompanyCoverCn(StringToCN.stringToCN(a.getCompanyCover()));
		return true;
	}

	@Override
	public boolean setApplicationTotalCostCn(Application a) {
		// TODO Auto-generated method stub
		//a.setTotalCostCn(StringToCN.stringToCN(a.getTotalCost()));
		return true;
	}

	@Override
	public List<String> getTrainingprogramByEmp(String empName) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession();
		List<String> list = sqlSession.selectList("APPLICATION_INFO.gettrainingprogrambyempname", empName);
		return list;
		
	}

	
}
