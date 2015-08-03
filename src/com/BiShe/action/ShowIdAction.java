package com.BiShe.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;
import org.apache.struts2.interceptor.SessionAware;

import com.opensymphony.xwork2.ActionSupport;
import com.BiShe.bean.Application;
import com.BiShe.bean.Employee;
import com.BiShe.bean.ProgramInfo;
import com.BiShe.dao.ApplicationDAOImpl;
import com.BiShe.dao.IApplicationDAO;
import com.BiShe.dao.RemoveSubmittedTrainingprogramFromList;


public class ShowIdAction extends ActionSupport implements ServletRequestAware,ServletResponseAware,SessionAware{
     private static final long serialVersionUID = 1L;
 	private HttpServletRequest request;
 	private HttpServletResponse response;
  	private Map<String, Object> session;
  	private String selectedname;
  	private String selectedid;
  	private Application application;
	private ProgramInfo programinfo;
	
	public ProgramInfo getPrograminfo() {
		return programinfo;
	}
	public void setPrograminfo(ProgramInfo programinfo) {
		this.programinfo = programinfo;
	}
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
	
	private List<ProgramInfo> list=new ArrayList<ProgramInfo>();
	public void getprogram(){

		response.setContentType("text/html;charset=utf-8");
		try {
			
			selectedname = request.getParameter("selectedname"); 
		 	IApplicationDAO iad = new ApplicationDAOImpl();
			List<String> userTrainingprograms = iad.getTrainingprogramByEmp(selectedname);
			RemoveSubmittedTrainingprogramFromList r = new RemoveSubmittedTrainingprogramFromList();
			r.removeSubmittedTrainingprogramFromList(list, userTrainingprograms);
	        JSONArray arr =JSONArray.fromObject(list);
			PrintWriter out = response.getWriter();	
			out.print(arr.toString());
			} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
	
}
