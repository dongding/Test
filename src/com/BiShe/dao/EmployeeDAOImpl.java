package com.BiShe.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.BiShe.bean.Employee;
import com.BiShe.bean.ProgramInfo;
import com.BiShe.db.ConnectionFactory;

public class EmployeeDAOImpl implements IEmployeeDAO{
	private SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
	private SqlSession sqlSession = null ; 
	
	public EmployeeDAOImpl() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public List<Employee> getAllApprovers() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Employee> list = sqlSession.selectList("EMPLOYEE_INFO.getallapprovers");
		sqlSession.close();
		return list;
	}
	

	@Override
	public Employee getEmployeeByName(String name) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		Employee e = sqlSession.selectOne("EMPLOYEE_INFO.getemployeebyempname",name);
		sqlSession.close();
		return e;
	}

	@Override
	public List<Employee> getAllEmployee() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Employee> list = sqlSession.selectList("EMPLOYEE_INFO.getallemployee");
		sqlSession.close();
		return list;
	}

	
	
	@Override
	public List<Employee> getAllAdmins() {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Employee> list = sqlSession.selectList("EMPLOYEE_INFO.getalladmins");
		sqlSession.close();
		return list;
	}


	@Override
	public List<Employee> getApproversForApproveer(String empName) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Employee> list = sqlSession.selectList("EMPLOYEE_INFO.getapproversforapprover",empName);
		sqlSession.close();
		return list;
	}

	@Override
	public List<Employee> getAdminsForAdmin(String empName) {
		// TODO Auto-generated method stub
		sqlSession = sqlSessionFactory.openSession(); 
		List<Employee> list = sqlSession.selectList("EMPLOYEE_INFO.getadminsforadmin",empName);
		sqlSession.close();
		return list;
	}

	@Override
	public List<ProgramInfo> getAllProgram() {
		sqlSession = sqlSessionFactory.openSession(); 
		List<ProgramInfo> list =sqlSession.selectList("EMPLOYEE_INFO.getallProgram");
		return list;
	}


}
