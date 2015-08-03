package com.BiShe.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.interceptor.ServletRequestAware;

import com.opensymphony.xwork2.ActionSupport;
import com.BiShe.bean.Employee;
import com.BiShe.dao.EmployeeDAOImpl;
import com.BiShe.dao.IEmployeeDAO;

public class LoginAction extends ActionSupport implements ServletRequestAware {
	private HttpServletRequest request;
	private String empName;
	private IEmployeeDAO ied = new EmployeeDAOImpl();
	@Override
	public void setServletRequest(HttpServletRequest arg0) {
		// TODO Auto-generated method stub
		this.request = arg0;
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}

	
	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	//login 
	public String login(){
		
		Employee e = ied.getEmployeeByName(empName);
		if(e == null){
			return ERROR;
		}else{
			request.getSession().setAttribute("user", e);
		}
		
		//check authority,go into 
		if(e.isEmployee()){
			return "employeemain";
		}
		if(e.isAdmin()){
			return "adminmain";
		} 
		if(e.isApprover()){
			return "approvermain";
		}
		return null;
		
	}
	
}
