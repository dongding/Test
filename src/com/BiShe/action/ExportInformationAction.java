package com.BiShe.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.BiShe.bean.Application;
import com.BiShe.dao.ExportDao;
public class ExportInformationAction extends ActionSupport implements SessionAware,ServletResponseAware{
	private static final long serialVersionUID = 1L;
	// store the information
	private Map<String, Object> session;
	private String informationId;
	private ExportDao exportDao=new ExportDao();
	private List<Application> list;
	private HttpServletResponse response;
	
	
	public List<Application> getList() {
		return list;
	}
	public void setList(List<Application> list) {
		this.list = list;
	}
	public ExportDao getExportDao() {
		return exportDao;
	}
	public void setExportDao(ExportDao exportDao) {
		this.exportDao = exportDao;
	}
	
	
	public String getInformationId() {
		return informationId;
	}
	public void setInformationId(String informationId) {
		this.informationId = informationId;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@SuppressWarnings("finally")
	public String execute() {
		response.setCharacterEncoding("utf-8");
		String[] arry=informationId.split(",");
		if(arry.length==0){
			return ERROR;
		}
		else{
			//exel titles
			List<Application> list = new ArrayList<Application>();
			List<String> list1 = new ArrayList<String>();
			
			for(String a:arry){
				list1.add(a);
			}
			list=exportDao.gettableapplication(list1);
			String trs = "";
			for(Application a:list){
				trs += "<tr>";
				trs += "<td style='text-align:left;'>"+a.getEmpId()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getEmpName()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getTrainingProgram()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getTrainingPeriodFrom()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getTrainingPeriodTo()+"</td>";
				trs += "<td style='text-align:left;vnd.ms-excel.numberformat:#,##0.00;'>"+a.getTotalCost()+"</td>";
				trs += "<td style='text-align:left;vnd.ms-excel.numberformat:#,##0.00;'>"+a.getCompanyCover()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getSetPeriod()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getServicePeriodFrom()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getServicePeriodTo()+"</td>";
				trs += "<td style='text-align:left;'>"+a.getStatus()+"</td>";
				trs += "</tr>";
			}
			response.setContentType("text/html");
			PrintWriter out = null;
			try {
				out = response.getWriter();
				out.print(trs);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

		}
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	
}
