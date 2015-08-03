package com.BiShe.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;






import com.BiShe.bean.Employee;
import com.BiShe.bean.Traffic;
import com.BiShe.dao.ITrafficDAO;
import com.BiShe.dao.TrafficDAOImpl;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class EmployeeTrafficAction extends ActionSupport implements ServletRequestAware,SessionAware,ServletResponseAware,ModelDriven<Traffic>  {
	private static final long serialVersionUID = 1L;
	private HttpServletRequest request;
	private HttpServletResponse response;
 	private Map<String, Object> session;
 	private Employee userRole;
 	
 	private Traffic traffic = new Traffic();
 	
 	private ITrafficDAO itd=new TrafficDAOImpl();
 	
 	private List<Employee> allapprover;
	private List<Employee> allemployee;
	private List<Employee> alladmin;
	
	private List<Traffic> traffics;
	private JSONArray trafficJson;
	private String tempId;
	public String saveTrafficByEmployee(){
		 if(!"disapproved".equals(traffic.getStatus())){
			 traffic.setStatus("unsubmit");
		 }
		 userRole = (Employee) request.getSession().getAttribute("user");
		 if(traffic.getApprover()==null||"".equals(traffic.getApprover())){
			traffic.setApprover("Cindy");
			if("Cindy".equalsIgnoreCase(userRole.getEmpName()) ){
			  traffic.setApprover("Cindy");
			}
		}
		if(traffic.getCc()==null||"".equals(traffic.getCc())){
			traffic.setCc("Eve;");
			if("Eve".equalsIgnoreCase(userRole.getEmpName()) ){
				  traffic.setApprover("Cindy;");
				}
		}
		if(userRole.getEmpId()==null||"".equals(userRole.getEmpId())){
			return "emp_insertsaveSUCCESS";
		}
		traffic.setEmpId(userRole.getEmpId());
		
		traffic.setEmpName(userRole.getEmpName());
		//System.out.println(traffic);
		if(itd.insertTraffic(traffic)){
		
	    	return "traf_insertsaveSUCCESS";
	    }else{
	    	return ERROR;
	    }
	
	}
	
    public String submitTrafficByEmployee() throws IOException {
    	
		userRole = (Employee) request.getSession().getAttribute("user");
		if(traffic.getApprover()==null||"".equals(traffic.getApprover())){
			traffic.setApprover("Cindy");
			if("Cindy".equalsIgnoreCase(userRole.getEmpName()) ){
			  traffic.setApprover("Cindy");
			}
		}
		if(traffic.getCc()==null||"".equals(traffic.getCc())){
			traffic.setCc("Eve;");
			if("Eve".equalsIgnoreCase(userRole.getEmpName()) ){
				  traffic.setCc("Eve;");
				}
		}
		
		
		if("disapproved".equals(traffic.getStatus())){
			traffic.setStatus("resubmitted");
		}else{
			traffic.setStatus("submitted");
		}
		traffic.setEmpId(userRole.getEmpId());
		traffic.setEmpName(userRole.getEmpName());
		String cc = traffic.getCc();
		String approver=traffic.getApprover();
		String[] approver1=approver.split("\\.");
		String approve2="";
		for(int i=0;i<approver1.length;i++){
			approve2+=approver1[i]+" ";
		}
		
		String ename=traffic.getEmpName();
		String [] name=ename.split("\\.");
		String ename1="";
		for(int i=0;i<name.length;i++){
			ename1+=name[i]+" ";
		}
		if(traffic.getDataId()>0){
			if(itd.updateByDataId(traffic)){
				return "traf_insertsaveSUCCESS";
			}
		 }
		if(itd.insertTraffic(traffic)){
	    	return "traf_insertsaveSUCCESS";
	    }else{
	    
	    	return "error";
	    }
	}
    

    public String showalltraffic() throws UnsupportedEncodingException {
    	
  		return "success";
  	}
    public String getAllTrafficByJson() throws UnsupportedEncodingException{
    	System.out.println("enter traffic action");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		userRole = (Employee) request.getSession().getAttribute("user");
		traffics =  itd.getTrafficByEmpid(userRole.getEmpId());
        System.out.println(traffics.get(0));
		
		trafficJson = JSONArray.fromObject(traffics);
		response.setContentType("text/html");
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.print(trafficJson.toString());
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	public Traffic getTraffic() {
		return traffic;
	}


	public void setTraffic(Traffic traffic) {
		this.traffic = traffic;
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
	
	public Traffic getModel() {
		// TODO Auto-generated method stub
		return traffic;
	}
	
	
	
	
	public List<Traffic> getTraffics() {
		return traffics;
	}


	public void setTraffics(List<Traffic> traffics) {
		this.traffics = traffics;
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
	
	public JSONArray getTrafficJson() {
		return trafficJson;
	}

	public void setTrafficJson(JSONArray trafficJson) {
		this.trafficJson = trafficJson;
	}

	public String getTempId() {
		return tempId;
	}
	public void setTempId(String tempId) {
		this.tempId = tempId;
	}
}
