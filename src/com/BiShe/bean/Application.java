package com.BiShe.bean;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;



/**
 * 
 * @author bin.zhou
 * 
 */
public class Application {
	private int dataId;
	private String empId;
	private String empName;
	private String approver;
	private String cc;
	private String trainingProgram;
	private String totalCost;
	private String companyCover;
	private String trainingPeriodFrom;
	private String trainingPeriodTo;
	private String setPeriod;
	private String servicePeriodFrom;
	private String servicePeriodTo;
	private String reason;
	private String createDate;
	private String createBy;
	private String updateDate;
	private String updateBy;
	private String status;
	private String rejectNotes;
	
	private String companyCoverCn;
	private String totalCostCn;
	private String yearCn;
	private String monthCn;
	private String dayCn;
	private int rejected;
	private String comments;
	private int commented;
	
	public Application() {
		super();
		// TODO Auto-generated constructor stub
		
	}
 

	public String getYearCn() {
		return yearCn;
	}
	public void setYearCn(String yearCn) {
		this.yearCn = yearCn;
	}
	public String getMonthCn() {
		return monthCn;
	}
	public void setMonthCn(String monthCn) {
		this.monthCn = monthCn;
	}
	public String getDayCn() {
		return dayCn;
	}
	public void setDayCn(String dayCn) {
		this.dayCn = dayCn;
	}
	public String getCompanyCoverCn() {
		return companyCoverCn;
	}
	public void setCompanyCoverCn(String companyCoverCn) {
		this.companyCoverCn = companyCoverCn;
	}
	public String getTotalCostCn() {
		return totalCostCn;
	}
	public void setTotalCostCn(String totalCostCn) {
		this.totalCostCn = totalCostCn;
	}
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
	public String getTrainingProgram() {
		return trainingProgram;
	}
	public void setTrainingProgram(String trainingProgram) {
		this.trainingProgram = trainingProgram;
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
	public String getTrainingPeriodFrom() {
		return trainingPeriodFrom;
	}
	public void setTrainingPeriodFrom(String trainingPeriodFrom) {
		this.trainingPeriodFrom = trainingPeriodFrom;
	}
	public String getTrainingPeriodTo() {
		return trainingPeriodTo;
	}
	public void setTrainingPeriodTo(String trainingPeriodTo) {
		this.trainingPeriodTo = trainingPeriodTo;
	}
	public String getSetPeriod() {
		return setPeriod;
	}
	public void setSetPeriod(String setPeriod) {
		this.setPeriod = setPeriod;
	}
	public String getServicePeriodFrom() {
		return servicePeriodFrom;
	}
	public void setServicePeriodFrom(String servicePeriodFrom) {
		this.servicePeriodFrom = servicePeriodFrom;
	}
	public String getServicePeriodTo() {
		return servicePeriodTo;
	}
	public void setServicePeriodTo(String servicePeriodTo) {
		this.servicePeriodTo = servicePeriodTo;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	
	public String getRejectNotes() {
		return rejectNotes;
	}
	public void setRejectNotes(String rejectNotes) {
		this.rejectNotes = rejectNotes;
	}
	
	
	
	public int getRejected() {
		return rejected;
	}
	public void setRejected(int rejected) {
		this.rejected = rejected;
	}
	@Override
	public String toString() {
		return "dataId=" + dataId + ", empId=" + empId
		+ ", empName=" + empName + ", approver=" + approver + ", cc="
		+ cc + ", trainingProgram=" + trainingProgram + ", totalCost="
		+ totalCost + ", companyCover=" + companyCover
		+ ", trainingPeriodFrom=" + trainingPeriodFrom
		+ ", trainingPeriodTo=" + trainingPeriodTo + ", setPeriod="
		+ setPeriod + ", servicePeriodFrom=" + servicePeriodFrom
		+ ", servicePeriodTo=" + servicePeriodTo + ", reason=" + reason
		+ ", createDate=" + createDate + ", createBy=" + createBy
		+ ", updateDate=" + updateDate + ", updateBy=" + updateBy
		+ ", status=" + status;
	      
	}
	
	public Application(String empId, String empName, String approver,
			String cc, String trainingProgram, String totalCost,
			String companyCover, String trainingPeriodFrom,
			String trainingPeriodTo, String setPeriod,
			String servicePeriodFrom, String servicePeriodTo, String reason,
			String createDate, String createBy, String updateDate,
			String updateBy, String status) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.approver = approver;
		this.cc = cc;
		this.trainingProgram = trainingProgram;
		this.totalCost = totalCost;
		this.companyCover = companyCover;
		this.trainingPeriodFrom = trainingPeriodFrom;
		this.trainingPeriodTo = trainingPeriodTo;
		this.setPeriod = setPeriod;
		this.servicePeriodFrom = servicePeriodFrom;
		this.servicePeriodTo = servicePeriodTo;
		this.reason = reason;
		this.createDate = createDate;
		this.createBy = createBy;
		this.updateDate = updateDate;
		this.updateBy = updateBy;
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getCommented() {
		return commented;
	}
	public void setCommented(int commented) {
		this.commented = commented;
	}
	
	
}
