package com.BiShe.bean;

public class Traffic {
	private int dataId;
	private String empId;
	private String empName;
	private String approver;
	private String cc;
	private String itemname;
	private String fromplace;
	private String toplace;
	private String totalCost;
	private String companyCover;
	private String itemdate;
	private String status;
	public int getDataId() {
		return dataId;
	}
	public void setDataId(int dataId) {
		this.dataId = dataId;
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
	public String getApprover() {
		return approver;
	}
	public void setApprover(String approver) {
		this.approver = approver;
	}
	public String getCc() {
		return cc;
	}
	public void setCc(String cc) {
		this.cc = cc;
	}
	public String getItemname() {
		return itemname;
	}
	public void setItemname(String itemname) {
		this.itemname = itemname;
	}
	public String getTotalCost() {
		return totalCost;
	}
	public void setTotalCost(String totalCost) {
		this.totalCost = totalCost;
	}
	public String getCompanyCover() {
		return companyCover;
	}
	public void setCompanyCover(String companyCover) {
		this.companyCover = companyCover;
	}
	public String getItemdate() {
		return itemdate;
	}
	public void setItemdate(String itemdate) {
		this.itemdate = itemdate;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getFromplace() {
		return fromplace;
	}
	public void setFromplace(String fromplace) {
		this.fromplace = fromplace;
	}
	public String getToplace() {
		return toplace;
	}
	public void setToplace(String toplace) {
		this.toplace = toplace;
	}
	@Override
	public String toString() {
		return "Traffic [dataId=" + dataId + ", empId=" + empId + ", empName="
				+ empName + ", approver=" + approver + ", cc=" + cc
				+ ", itemname=" + itemname + ", formplace=" + fromplace
				+ ", toplace=" + toplace + ", totalCost=" + totalCost
				+ ", companyCover=" + companyCover + ", itemdate=" + itemdate
				+ ", status=" + status + "]";
	}
	public Traffic() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	

}
