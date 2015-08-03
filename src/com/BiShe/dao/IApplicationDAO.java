package com.BiShe.dao;

import java.util.List;

import com.BiShe.bean.Application;
import com.BiShe.bean.Employee;
public interface IApplicationDAO {
	/**
	 * get a list of application by empid
	 * @param empid
	 * @return list of Application
	 */
	List<Application> getApplicationByEmpid(String empid);
	/**
	 * get an application by dataid
	 * @param id
	 * @return Application
	 */
    Application getApplicationById(int dataid);
    /**
     * update an application 
     * @param a
     * @return boolean
     */
    boolean updateByDataId(Application a);
    /**
     * get max dataid
     * @return
     */
    int getMaxDataId();
    /**
     * insert an application record
     * @param a
     * @return boolean
     */
    
    boolean insertApplication(Application a);
    
    /**
     * get all application
     * @return Application
     */
    List<Application> getAllApplication();
    /**
     * get a list of applications whose status are unsubmit
     * @return Application
     */
    List<Application> getApplicationByStatus();
    /**
     *  get a list of applications whose status are submit
     * @return Application
     */
    List<Application> getApplicationListForApprover(Employee e);
    
    List<String> getTrainingprogramByEmp(String empName);
    /**
     * approve or disapprove an application
     * @param a
     * @return boolean
     */
    boolean updateStatusAndUpdateDate(Application a);
    /**
     * update reject notes
     * @param a
     * @return boolean
     */
    boolean updateRejectNotes(Application a);
    
    boolean updateComments(Application a);
    
    boolean deleteApplicationByDataId(int dataId);
    
    double stringParseDouble(String s);
    
    boolean setApplicationCompanyCoverRate(Application a);
    
    boolean setAgreementCreateDate(Application a);
    
    String getFormatUpdateDate(Application a);
    
    boolean setApplicationTotalCostCn(Application a);
    
    boolean setApplicationCompanyCoverCn(Application a);
}
