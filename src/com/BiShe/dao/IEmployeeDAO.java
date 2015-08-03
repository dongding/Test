package com.BiShe.dao;

import java.util.List;

import com.BiShe.bean.Employee;
import com.BiShe.bean.ProgramInfo;

public interface IEmployeeDAO {
	/**
	 * get List of Employee
	 * @return List of Employee
	 */
	public List<Employee> getAllApprovers();
	/**
	 * get an employee by name
	 * @param name
	 * @return Employee
	 */
	public Employee getEmployeeByName(String name);
	/**
	 * get all Employee
	 * @return List of Employee
	 */
	public List<Employee> getAllEmployee();
	
	
	/**
	 * get List of Admin
	 * @return List of Employee
	 */
	public List<Employee> getAllAdmins();
	
	public List<Employee> getApproversForApproveer(String empName);
	
	public List<Employee> getAdminsForAdmin(String empName);
	
	public List<ProgramInfo> getAllProgram();

}
