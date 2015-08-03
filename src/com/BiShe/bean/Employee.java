package com.BiShe.bean;
/**
 * 
 * @author bin.zhou
 *
 */
public class Employee {
	private String empId;
	private String empName;
	private String email;
	private String authority;
	
	public boolean isEmployee(){
		  return "employee".equalsIgnoreCase(getAuthority());
	}
	public boolean isApprover(){
		  return "approver".equalsIgnoreCase(getAuthority());
	}
	public boolean isAdmin(){
	  return "admin".equalsIgnoreCase(getAuthority());
	}
	
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAuthority() {
		return authority;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	@Override
	public String toString() {
		return "Employee [authority=" + authority + ", email=" + email
				+ ", empId=" + empId + ", empName=" + empName + "]";
	}
	
	
}
