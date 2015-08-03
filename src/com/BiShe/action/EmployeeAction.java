package com.BiShe.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.BiShe.bean.Application;
import com.BiShe.bean.Employee;
import com.BiShe.bean.ProgramInfo;
import com.BiShe.bean.Traffic;
import com.BiShe.dao.ApplicationDAOImpl;
import com.BiShe.dao.EmployeeDAOImpl;
import com.BiShe.dao.IApplicationDAO;
import com.BiShe.dao.IEmployeeDAO;
import com.BiShe.dao.ITrafficDAO;
import com.BiShe.dao.ITrafficDAO;
import com.BiShe.dao.RemoveSubmittedTrainingprogramFromList;
import com.BiShe.dao.TrafficDAOImpl;
/**
 * 
 * @author change.chen Action for Application
 *
 */
public class EmployeeAction extends ActionSupport implements ServletRequestAware,SessionAware,ServletResponseAware,ModelDriven<Application> {

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
 	private Map<String, Object> session;
 	private Employee userRole;
 	private Application application = new Application();
 	private IApplicationDAO iad = new ApplicationDAOImpl();
 	private IEmployeeDAO ied = new EmployeeDAOImpl();
 	private List<Employee> allapprover;
	private List<Employee> allemployee;
	private List<Employee> alladmin;
	private List<ProgramInfo> alltrainingprogram;
	private List<Application> applications;
	private JSONArray applicationsJson;
	private String tempId;
	
	private List<Traffic> traffics;
	private ITrafficDAO itd=new TrafficDAOImpl();
	private JSONArray trafficJson;
	
	public String showOneAgreementByDataId(){
		int dataId = Integer.parseInt(request.getParameter("dataId"));
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		Application application = iad.getApplicationById(dataId);
		
		
		String updateDate = iad.getFormatUpdateDate(application);
		application.setUpdateDate(updateDate);
		PrintWriter out = null;
		try {
			out = response.getWriter();
			JSONArray json = JSONArray.fromObject(application);
			out.print(json.toString());
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	
	public String deleteApplicationByDataId(){
		int dataId = Integer.parseInt(request.getParameter("dataId"));
		if(iad.deleteApplicationByDataId(dataId)){
			return "delete_success";
		}else{
			return "delete_error";
		}
	}
	
	/**
	 * @return
	 * @throws UnsupportedEncodingException 
	 */
	public String getAllApplicationByJson() throws UnsupportedEncodingException{
		System.out.println("enter application action");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		userRole = (Employee) request.getSession().getAttribute("user");
		applications = iad.getApplicationByEmpid(userRole.getEmpId());
		traffics =  itd.getTrafficByEmpid(userRole.getEmpId());
		
		
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
	
	
	public String showAllApplication(){
		return "success";
	}
	
  
	
	
	public String getAllProgramByJson(){
		System.out.println("enter program json");
		alltrainingprogram  = ied.getAllProgram();
        
//		userRole = (Employee) request.getSession().getAttribute("user");
//		List<String> userTrainingprograms = iad.getTrainingprogramByEmp(userRole.getEmpName());
//
//		RemoveSubmittedTrainingprogramFromList r = new RemoveSubmittedTrainingprogramFromList();
//		r.removeSubmittedTrainingprogramFromList(alltrainingprogram, userTrainingprograms);
		PrintWriter out = null;
		try {
			JSONArray arr =JSONArray.fromObject(alltrainingprogram);
			response.setContentType("text/html");
			out = response.getWriter();
			
			out.print(arr.toString());
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
		
		return null;
	}
	
	public String getAllApproverByJson(){
 		
		userRole = (Employee) request.getSession().getAttribute("user");
		if(userRole.isApprover()){
			allapprover = ied.getApproversForApproveer(userRole.getEmpName());
		}else{
			allapprover = ied.getAllApprovers();
		}
    	PrintWriter out = null;
 		try {
 			JSONArray arr =JSONArray.fromObject(allapprover);
 			response.setContentType("text/html");
 			out = response.getWriter();
 			
 			out.print(arr.toString());
 			return null;
 		} catch (IOException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}			
 		
 		return null;
 	}

 public String getAllAdimByJson(){
	
    alladmin = ied.getAllAdmins();
	PrintWriter out = null;
	try {
		JSONArray arr =JSONArray.fromObject(alladmin);
		response.setContentType("text/html");
		out = response.getWriter();
		
		out.print(arr.toString());
		return null;
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}			
	
	return null;
}
 
	
	//get prepared to add an application record
	public String prepareToAddApplication() {
		System.out.println("aaa");
		// TODO Auto-generated method stub
		try {
			userRole = (Employee) request.getSession().getAttribute("user");
			if(userRole.isApprover()){
				allapprover = ied.getApproversForApproveer(userRole.getEmpName());
				alladmin = ied.getAllAdmins();
				return "prepare_approver_success";
			}
			
			allapprover = ied.getAllApprovers();
			alladmin = ied.getAllAdmins();
		    return "success";
		
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
	    }
	}  
  //save by employee
	public String saveByEmployee(){
		 if(!"disapproved".equals(application.getStatus())){
			 application.setStatus("unsubmit");
		 }
		 userRole = (Employee) request.getSession().getAttribute("user");
		 if(application.getApprover()==null||"".equals(application.getApprover())){
			application.setApprover("Cindy");
			if("Cindy".equalsIgnoreCase(userRole.getEmpName()) ){
			  application.setApprover("Cindy");
			}
		}
		if(application.getCc()==null||"".equals(application.getCc())){
			application.setCc("Eve;");
			if("Eve".equalsIgnoreCase(userRole.getEmpName()) ){
				  application.setApprover("Cindy;");
				}
		}
		if(userRole.getEmpId()==null||"".equals(userRole.getEmpId())){
			return "emp_insertsaveSUCCESS";
		}
		application.setEmpId(userRole.getEmpId());
		
		application.setEmpName(userRole.getEmpName());
		if(application.getDataId()>0){
			if(iad.updateByDataId(application)){
				if(userRole.isAdmin()) {
					return "adminAsEmp_insertsaveSUCCESS";
				}
				
				if(userRole.isApprover()){
					return "approverAsEmp_insertsaveSUCCESS";
				}
				return "emp_updatesaveSUCCESS";
			}
		 }
		if(iad.insertApplication(application)){
			
			if(userRole.isAdmin()) {
				return "adminAsEmp_insertsaveSUCCESS";
			}
			if(userRole.isApprover()){
				return "approverAsEmp_insertsaveSUCCESS";
			}
	    	return "emp_insertsaveSUCCESS";
	    }else{
	    	return ERROR;
	    }
	
	
	}
	

	public String checkProgramRepeat(){
		System.out.println("enter submit");
		String program = request.getParameter("program");
		String ename =	((Employee)request.getSession().getAttribute("user")).getEmpName();
		IApplicationDAO iad = new ApplicationDAOImpl();
		List<String> userTrainingprograms = iad.getTrainingprogramByEmp(ename);
		String r = "N";
		for(int i = 0; i < userTrainingprograms.size(); i++){
			if(userTrainingprograms.get(i).trim().replace(" ", "").equalsIgnoreCase(program.trim().replace(" ", ""))){
				r = "Y";
				break;
			}
		}
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(r);
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	
	//employee submit an application record
    public String submitByEmployee() throws IOException {
		userRole = (Employee) request.getSession().getAttribute("user");
		if(application.getApprover()==null||"".equals(application.getApprover())){
			application.setApprover("Cindy");
			if("Cindy".equalsIgnoreCase(userRole.getEmpName()) ){
			  application.setApprover("Cindy");
			}
		}
		
		
		if(application.getCc()==null||"".equals(application.getCc())){
			application.setCc("Eve;");
			if("Eve".equalsIgnoreCase(userRole.getEmpName()) ){
				  application.setCc("Eve;");
				}
		}
		
		
		if("disapproved".equals(application.getStatus())){
			application.setStatus("resubmitted");
		}else{
			application.setStatus("submitted");
		}
		application.setEmpId(userRole.getEmpId());
		application.setEmpName(userRole.getEmpName());
		iad.setApplicationCompanyCoverRate(application);
		iad.setApplicationCompanyCoverCn(application);
		iad.setApplicationTotalCostCn(application);
		String cc = application.getCc();
		String approver=application.getApprover();
		String[] approver1=approver.split("\\.");
		String approve2="";
		for(int i=0;i<approver1.length;i++){
			approve2+=approver1[i]+" ";
		}
		String program=application.getTrainingProgram();
		String ename=application.getEmpName();
		String [] name=ename.split("\\.");
		String ename1="";
		for(int i=0;i<name.length;i++){
			ename1+=name[i]+" ";
		}	
		if(application.getDataId()>0){
			
			if(iad.updateByDataId(application)){
				
				
				if(userRole.isAdmin()){
					return "adminAsEmp_insertSUCCESS";
				}
				if(userRole.isApprover()){
					return "approverAsEmp_insertSUCCESS";
				}
				return "emp_updateSUCCESS";
			}
		 }
		if(iad.insertApplication(application)){
			
			
			if(userRole.isAdmin()){
				return "adminAsEmp_insertSUCCESS";
			}
			if(userRole.isApprover()){
				return "approverAsEmp_insertSUCCESS";
			}
	    	return "emp_insertSUCCESS";
	    }else{
	    
	    	return "error";
	    }
	}

	//show a list of application record by empId
	public String showApplicationByEmpId(){
		userRole = (Employee) request.getSession().getAttribute("user");
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
	
	//show an application record in detail
	public String showDetail(){
		userRole = (Employee) request.getSession().getAttribute("user");
		String id = request.getParameter("id");
		application = iad.getApplicationById(Integer.parseInt(id));
		if(application.getStatus().equals("unsubmit")){
			tempId = id;
			request.setAttribute("tempId",id);
			if(userRole.isAdmin()){
				return "admin_unsubmit";
			}
			return "unsubmit";
		}else{
			return "submit";
		}
	}
	
	public String getApplicationById(){
		tempId = request.getParameter("tempId");
		
		application = iad.getApplicationById(Integer.parseInt(tempId));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(application.toString());
			return null;
		} catch (Exception ee) {
			// TODO Auto-generated catch block
			ee.printStackTrace();
		}
		return null;
	}
	

	
	public Application getApplication() {
		return application;
	}
	public void setApplication(Application application) {
		this.application = application;
	}
	public Employee getEmployee() {
		return userRole;
	}
	public void setEmployee(Employee employee) {
		this.userRole = employee;
	}
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	public Map<String, Object> getSession() {
		return session;
	}
	public void setSession(Map<String, Object> session){
		this.session = session;
	}
	
	public HttpServletRequest getRequest() {
		return request;
	}
	public void setRequest(HttpServletRequest request) {
		this.request = request;
	}
	@Override
	public void setServletResponse(HttpServletResponse arg0) {
		// TODO Auto-generated method stub
		this.response = arg0;
	}
	@Override
//	public Application getModel() {
//		// TODO Auto-generated method stub
//		return application;
//	}
	
	public Application getModel() {
		// TODO Auto-generated method stub
		return application;
	}
	
	public List<Application> getApplications() {
		return applications;
	}
	public void setApplications(List<Application> applications) {
		this.applications = applications;
	}
	
	private JSONArray jsonApplication;
	
	
	public JSONArray getJsonApplication() {
		return jsonApplication;
	}
	
	

	public void setJsonApplication(JSONArray jsonApplication) {
		this.jsonApplication = jsonApplication;
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
	public List<ProgramInfo> getAlltrainingprogram() {
		return alltrainingprogram;
	}
	public void setAlltrainingprogram(List<ProgramInfo> alltrainingprogram) {
		this.alltrainingprogram = alltrainingprogram;
	}
	public List<Employee> getAlladmin() {
		return alladmin;
	}
	public void setAlladmin(List<Employee> alladmin) {
		this.alladmin = alladmin;
	}
	public JSONArray getApplicationsJson() {
		return applicationsJson;
	}
	public void setApplicationsJson(JSONArray applicationsJson) {
		this.applicationsJson = applicationsJson;
	}
	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
	
	
	
}

