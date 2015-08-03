package com.BiShe.action;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
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
import com.BiShe.bean.Comment;
import com.BiShe.bean.Employee;
import com.BiShe.bean.Note;
import com.BiShe.bean.ProgramInfo;
import com.BiShe.dao.ApplicationDAOImpl;
import com.BiShe.dao.CommentDAOImpl;
import com.BiShe.dao.EmployeeDAOImpl;
import com.BiShe.dao.IApplicationDAO;
import com.BiShe.dao.ICommentDAO;
import com.BiShe.dao.IEmployeeDAO;
import com.BiShe.dao.INoteDAO;
import com.BiShe.dao.NoteDAOImpl;
/**
 * 
 * @author change.chen Action for Application
 *
 */
public class ApproverAction extends ActionSupport implements ServletRequestAware,SessionAware,ServletResponseAware,ModelDriven<Application> {

	
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
 	private INoteDAO ind = new NoteDAOImpl();
	private ICommentDAO icd = new CommentDAOImpl();
 	private List<Comment> historyComments;
 	private List<Note> historyNotes;
 	private List<Employee> allapprover;
	private List<Employee> allemployee;
	private List<Employee> alladmin;
	private List<ProgramInfo> alltrainingprogram;
	private List<Application> applications;
	private JSONArray applicationsJson;
	private String tempId;
	
	
	
	
	//get application list for approver
	public String getAllApplicationForApproverByJson() throws UnsupportedEncodingException{
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		userRole = (Employee) request.getSession().getAttribute("user");
		applications = iad.getApplicationListForApprover(userRole);
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
	//approve
	public String approve(){
		String sdataid = request.getParameter("dataid") ;
		String[] dataids = sdataid.split(",");
		int dataid;
		for(int k=0;k<dataids.length;k++){
			dataid = Integer.parseInt(dataids[k]);
			Application a = iad.getApplicationById(dataid);
			a.setStatus("approved");
			String approver=a.getApprover();
			String cc=a.getCc();
			String[] approver1=approver.split("\\.");
			String approve2="";
			for(int i=0;i<approver1.length;i++){
				approve2+=approver1[i]+" ";
			}
	        String ename=a.getEmpName();
	        String [] name=ename.split("\\.");
			String ename1="";
			
			for(int i=0;i<name.length;i++){
				ename1+=name[i]+" ";
			}
	        String program=a.getTrainingProgram();
			if(iad.updateStatusAndUpdateDate(a)){
				iad.setAgreementCreateDate(a);
				iad.updateByDataId(a);
				
			}else{
				return "approved_fail";
			}
		}
		
		return "approved";
	}
	//disapprove
	public String disapprove(){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String sdataid = request.getParameter("dataid") ;
		System.out.println("11111+++++"+sdataid);
		String[] dataids = sdataid.split(",");
		int dataid;
		String rejectNotes = "";
		
			rejectNotes = request.getParameter("rejectNotes");
		
        System.out.println("22222++++++++"+rejectNotes);
		for(int i=0;i<dataids.length;i++){
			
			dataid = Integer.parseInt(dataids[i]);
			
			Note n = new Note();
			n.setDataId(dataid);
			n.setHistoryNotes(rejectNotes);
			System.out.println("444444444444xunhuan");
			ind.insertNote(n);
			System.out.println("6666666666+++++++++"+n);
			Application a = iad.getApplicationById(dataid);
			System.out.println("55555555555555xunhuan");
			a.setRejected(1);
			a.setStatus("disapproved");
			a.setRejectNotes(rejectNotes);
			System.out.println("333333+++++++"+a.toString());
			if(iad.updateStatusAndUpdateDate(a) && iad.updateRejectNotes(a)){
				System.out.println("=================");
				
			}else{
				System.out.println("hahahhah");
				return null;
			}
		}
		System.out.println("7777777777out");
		return null;
		
	}
	public String addComment(){
		try {
			request.setCharacterEncoding("utf-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		userRole = (Employee) request.getSession().getAttribute("user");
		int dataid = Integer.parseInt(request.getParameter("dataid")) ;
		Application a = iad.getApplicationById(dataid);

		String comment = "";
		
			comment = request.getParameter("comments");
		

		Comment c = new Comment();
		c.setDataId(dataid);
		c.setCreateBy(userRole.getEmpName());
		c.setHistoryComments(comment);
		a.setCommented(1);
		a.setComments(comment);
		if(icd.insertComment(c) && iad.updateComments(a)){
			return null;
		}else{
			return null;
		}		
	}	
	
    public String getHistoryNotesByDataId(){
    	int dataId = Integer.parseInt(request.getParameter("dataid")) ;
    	historyNotes = ind.getHistoryNotesByDataId(dataId);
    	PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			String trs = "";
			for(Note n:historyNotes){
				trs += "<tr style='height:16px;'>";
				trs += "<td style='width:150px;'>"+n.getCreateDate()+"</td>";
				trs += "<td style='width:750px; '><p style='word-break:break-all;width:600px;font-size:13px'>"+n.getHistoryNotes()+"</p></td>";
				trs += "</tr>";
			}
			out.print(trs);
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}			
    	return null;
    	
    }
    public String getHistoryCommentsByDataId(){
    	int dataId = Integer.parseInt(request.getParameter("dataid")) ;
    	historyComments = icd.getHistoryCommentsByDataId(dataId);
    	PrintWriter out = null;
		try {
			response.setContentType("text/html;charset=utf-8");
			out = response.getWriter();
			String trs = "";
			for(Comment n:historyComments){
				trs += "<tr style='height:16px;'>";
				trs += "<td style='width:150px;'>"+n.getCreateDate()+"</td>";
				trs += "<td style='width:150px;'>"+n.getCreateBy()+"</td>";
				trs += "<td style='width:600px; '><p style='word-break:break-all;width:600px;font-size:13px'>"+n.getHistoryComments()+"</p></td>";
				trs += "</tr>";
			}
			out.print(trs);
			return null;
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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


