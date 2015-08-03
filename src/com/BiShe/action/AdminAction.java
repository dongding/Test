package com.BiShe.action;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.BiShe.bean.Application;
import com.BiShe.bean.Employee;
import com.BiShe.dao.ApplicationDAOImpl;
import com.BiShe.dao.EmployeeDAOImpl;
import com.BiShe.dao.IApplicationDAO;
import com.BiShe.dao.IEmployeeDAO;
import com.BiShe.db.ConnectionFactory;

public class AdminAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,ModelDriven<Application>{
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
 	private Employee userRole;
 	private Application application = new Application();
 	private IApplicationDAO iad = new ApplicationDAOImpl();
 	private IEmployeeDAO ied = new EmployeeDAOImpl();
	private List<Application> applications;
	private String tempId;
	private List<Employee> allapprover;
	private List<Employee> allemployee;
	private List<Employee> alladmin;
	
	private JSONArray applicationsJson;
	private String selectedname;
  	private String selectedid;
	public Application getApplication() {
		return application;
	}

	public void setApplication(Application application) {
		this.application = application;
	}

	public String getSelectedid() {
		return selectedid;
	}

	public void setSelectedid(String selectedid) {
		this.selectedid = selectedid;
	}

	
	public String getSelectedname() {
		return selectedname;
	}
	public void setSelectedname(String selectedname) {
		this.selectedname = selectedname;
	} 
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	public String getAllApplicationByStatus() throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		applications = iad.getApplicationByStatus();
		for(int i=0;i<applications.size();i++){
			
			if(applications.get(i).getStatus().equals("approved_save")||applications.get(i).getStatus().equals("submitted_save")||applications.get(i).getStatus().equals("_save")){
				applications.get(i).setStatus("unsubmit");
			}
		}
		applicationsJson = JSONArray.fromObject(applications);
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(applicationsJson.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	//get prepared to add an application record
	public String preparetoaddapplication() {
		// TODO Auto-generated method stub
		try {
			userRole = (Employee) request.getSession().getAttribute("user");
			allapprover = ied.getAllApprovers();
			alladmin = ied.getAdminsForAdmin(userRole.getEmpName());
			return "prepareSUCCESS";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
	    }
	}  
	public String getApplicationById(){
		tempId = request.getParameter("tempId");
		application = iad.getApplicationById(Integer.parseInt(tempId));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONArray jsons = JSONArray.fromObject(application);
			out.print(application.toString());
			return null;
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	//show a list of application record by status
	public String showApplicationByEmpId(){
		applications = iad.getApplicationByEmpid(userRole.getEmpId());
		
		response.setContentType("text/html;charset=utf-8");
		
		
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONArray jsons = JSONArray.fromObject(applications);
			out.print(jsons.toString());
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	public String saveByAdmin(){
		userRole = (Employee) request.getSession().getAttribute("user");
		if(application.getApprover()==null||"".equals(application.getApprover())){
			application.setApprover("Cindy");
			if("Cindy".equalsIgnoreCase(application.getEmpName()) ){
			  application.setApprover("Cindy");
			}
		}
		
		
		if(application.getCc()==null||"".equals(application.getCc())){
			application.setCc("Eve;");
			if("Eve".equalsIgnoreCase(application.getEmpName()) ){
				  application.setCc("Eve;");
				}
		}
		if(application.getStatus().equals("approved")){
			application.setStatus("approved_save");
		}
		else if(application.getStatus().equals("submitted")){
			application.setStatus("submitted_save");
		}
		else if(application.getStatus().equals("")){
			application.setStatus("_save");
		}
		if(application.getDataId()>0){
			if(iad.updateByDataId(application)){
				return "admin_updatesaveSUCCESS";
			}
		 }
		if(iad.insertApplication(application)){
			request.setAttribute("info", "save success!");
	    	return "admin_insertsaveSUCCESS";
	    }else{
	    	return ERROR;
	    }
	}
	
	public String submit() {
		userRole = (Employee) request.getSession().getAttribute("user");
		if(application.getApprover()==null||"".equals(application.getApprover())){
			application.setApprover("Vernon.Stinebaker");
			if("Vernon.Stinebaker".equalsIgnoreCase(application.getEmpName()) ){
			  application.setApprover("Kevin.Sheen");
			}
		}
		
		
		if(application.getCc()==null||"".equals(application.getCc())){
			application.setCc("Eve;");
			if("Eve".equalsIgnoreCase(application.getEmpName()) ){
				  application.setCc("Eve;");
				}
		}
		
		iad.setApplicationCompanyCoverRate(application);
		iad.setApplicationCompanyCoverCn(application);
		iad.setApplicationTotalCostCn(application);
		
		if(application.getDataId()>0){
			if(iad.updateByDataId(application)){
				if(application.getStatus().equals("approved")){
					application = iad.getApplicationById(application.getDataId());
					iad.setAgreementCreateDate(application);
					iad.updateByDataId(application);
				}
				return "admin_updatesaveSUCCESS";
			}
		 }
		
		int dataId = iad.getMaxDataId()+1;
		application.setDataId(dataId);
		
		if(iad.insertApplication(application)){
			if(application.getStatus().equals("approved")){
				application = iad.getApplicationById(application.getDataId());
				iad.setAgreementCreateDate(application);
				iad.updateByDataId(application);
			}
			
			
	    	return "admin_insertsaveSUCCESS";
	    }else{
	    	return ERROR;
	    }
	}
	//show an application record in detail
	public String showDetail() throws UnsupportedEncodingException{

		String id = request.getParameter("id");
		application = iad.getApplicationById(Integer.parseInt(id));
		if(application.getStatus().equals("unsubmit")){
			tempId = id;
			request.setAttribute("tempId",id);
			return "unsubmit";
		}else{
			return "submit";
		}
	}
	
	
	
	
	
	
	
	
	
	public String getId() {
		return tempId;
	}

	public void setId(String id) {
		tempId = id;
	}

	@Override
	public void setServletRequest(HttpServletRequest request) {
		// TODO Auto-generated method stub
		this.request = request;
	}

	@Override
	public void setServletResponse(HttpServletResponse response) {
		// TODO Auto-generated method stub
		this.response = response;
	}

	@Override
	public Application getModel() {
		// TODO Auto-generated method stub
		return application;
	}
	public JSONArray getApplicationsJson() {
		return applicationsJson;
	}
	public void setApplicationsJson(JSONArray applicationsJson) {
		this.applicationsJson = applicationsJson;
	}
	
	
	
	public String showId() {
		// TODO Auto-generated method stub
		try {
			
			SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			selectedname = request.getParameter("selectedname");
			String empId = sqlSession.selectOne("EMPLOYEE_INFO.showidsql", selectedname);
			PrintWriter out = response.getWriter();
			out.print(empId);		
			return null;
	}catch (Exception e) {
		e.printStackTrace();
		return null;
	}  
	}
	
	public void showName() {
		// TODO Auto-generated method stub
		try {
			SqlSessionFactory sqlSessionFactory = ConnectionFactory.getConnection();
			SqlSession sqlSession = sqlSessionFactory.openSession();
			selectedid = request.getParameter("selectedid");
			String empName = sqlSession.selectOne("EMPLOYEE_INFO.shownamesql", selectedid);
			PrintWriter out = response.getWriter();
			out.print(empName);
	}catch (Exception e) {
		e.printStackTrace();
	}  
	}

	public List<Employee> getAllapprover() {
		return allapprover;
	}

	public void setAllapprover(List<Employee> allapprover) {
		this.allapprover = allapprover;
	}

	public List<Employee> getAllemployee() {
		return allemployee;
	}

	public void setAllemployee(List<Employee> allemployee) {
		this.allemployee = allemployee;
	}

	public List<Employee> getAlladmin() {
		return alladmin;
	}

	public void setAlladmin(List<Employee> alladmin) {
		this.alladmin = alladmin;
	}

	
	//applicant and id information
	public String getAllApplication(){
		allemployee = ied.getAllEmployee();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONArray allemp = JSONArray.fromObject(allemployee);
			out.print(allemp.toString());
			return null;
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	public String getAllApplication1(){
		allapprover=ied.getAllApprovers();
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONArray allemp = JSONArray.fromObject(allapprover);
			out.print(allemp.toString());
			return null;
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	
}
