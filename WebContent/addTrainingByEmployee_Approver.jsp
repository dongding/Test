<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.List"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/angular.js"></script>

<style>

.titlelist > li > a {
	color: gray;
}

a{
	font-size: 13px;
}
</style>
</head>
<body style="container-fluid" ng-app="">
	<div class="row">
		<ul class="breadcrumb"  style="padding-left: 30px;">
    		<li><a href="#">Training&nbsp;Tracking</a></li>
   			<li><a href="#">Add New Application</a></li>
  		</ul>
	</div>
	<div class="row bs-docs-example" style="height: 560px;">
		<div class="col-xs-2">
				<ul class="nav nav-pills nav-stacked" role="tablist" style="margin-top: 15px;">
				<li class="active"><a href="preparetoaddapplication" target="mainFrame"><i class="icon-chevron-right"></i>Add New Application</a></li>
				<li><a href="approverMain.jsp" target="approverMain"><i class="icon-chevron-right"></i>Training Application</a></li>
				<li><a href="" target="mainFrame"><i class="icon-chevron-right"></i>Training Agreement</a></li>
			</ul>
		</div>
		<div class="col-xs-10">
		
		
		<!-- content employee -->
		<div style="margin-left: 0px;" id="employeeform" ng-controller="addAsEmployee" >
			<div class="row"  style="display:{{checkState()}}; margin-top:5px;margin-buttom:0px;">			
				<div class="alert alert-warning" role="alert" style="margin-bottom:0px;  ">
					<strong>Warning!</strong> {{msg3||checkMoney()||checkTime()}}		
				</div>	
			</div>
			<div class="row" style="margin-top:0px;margin-left: 30px;">
				<!-- form -->
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<s:property value="#request.info"/>
				<form class="form-horizontal" method="post" id="saveEmp" name="saveEmp" role="form" action="">
					
					<input name="tempId" value="${requestScope.tempId}" id="tempId" type="hidden" />
					<s:hidden name="dataId" value="%{model.dataId}"></s:hidden>
					<div class="row"> 						
  						<div class="col-xs-2" style="margin-left:1px" >*&nbsp;Applicant</div>
		 				<div class="col-xs-3">${user.empName}</div>
		 				<div class="col-xs-2">*&nbsp;Employee&nbsp;ID</div>
  						<div class="col-xs-3">${user.empId}</div>
  					</div>
  					<div class="row">
   					<div class="col-xs-2">*&nbsp;Chinese&nbsp;name</div>
   					<div class="col-xs-3">  						
   								<input type="text" class="form-control input-sm" name="chineseName" id="chineseName"  />
   							
   					</div>
   					<div class="col-xs-2">*&nbsp;ID&nbsp; number</div>
   					<div class="col-xs-3">  						
   								<input type="text" class="form-control input-sm" name="idNumber" id="idNumber"  />
   							
   					</div>
   					</div>
  					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Approver</div>
   						<div class="col-xs-3">
   							<div class="input-group">
  								<input type="text" class="form-control input-sm"  name="approver" ng-model="approver" placeholder="Vernon.Stinebaker" style="background-color:white;" id="approver" readOnly="true"/>
   								<div class="input-group-btn">
   									<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>
 			 						<ul class="dropdown-menu dropdown-menu-right" role="menu">
    									<s:iterator  value="allapprover" var="allapp">
                		                	<li><a href="javascript:void(0);"  ng-click="setApprover('${allapp.empName}')">${allapp.empName}</a></li>
                	                 	</s:iterator>   	
  									</ul>
								</div>
							</div>
						</div>
   					</div>
   					<div class="row">
   						<div class="col-xs-2">*&nbsp;CC</div>
   						<div class="col-xs-3">
   							<div class="input-group">
  								<input type="text" class="form-control input-sm"  name="cc" ng-model="cc" id="cc"   placeholder="Fanny.Wang" 
  								style=" background-color:white; white-space:nowrap;text-overflow:ellipsis;
 					-o-text-overflow:ellipsis;overflow: hidden; "title={{cc}} />
   								<div class="input-group-btn">
   									<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>
 			 						<ul class="dropdown-menu dropdown-menu-right" role="menu">
    									<s:iterator  value="alladmin" var="alladm" >
                		                	<li id="${alladm.empName}"><a href="javascript:void(0);" ng-click="setCc('${alladm.empName}')">${alladm.empName}</a></li>
                	                 	</s:iterator>  
  									</ul>
								</div>
							</div>
						</div>
   					</div>
   					
   					<div class="row">
   					<div class="col-xs-2">*&nbsp;Training orgnization</div>
   					<div class="col-xs-8">  						
   								<input type="text" class="form-control input-sm" name="trainingOrgnization" id="trainingOrgnization"  />
   							
   					</div>
   					</div>
   					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Training&nbsp;program</div>
   						<div class="col-xs-8">
   							
   							
  							<input type="text"  class="form-control input-sm " id="trainingProgram" data-toggle="dropdown" ng-onfocus="{{getAllTrainingProgram()}}" name="trainingProgram" value="%{application.trainingProgram }" ng-model="program"  style="background-color:white;"/>
 			 			       <ul class="col-xs-12 dropdown-menu dropdown-menu-left " role="menu" aria-labelledby="trainingProgram" style="max-height:250px;overflow-y:scroll;">
		    					       <li ng-repeat="per in all | filter:{programName:program}" ng-click="setProgram(per.programName)">
		    					         <a href="javascript:void(0);">{{per.programName}}</a>
		    					       </li> 
  							   </ul>
								
							
						</div>
   					</div>
  					<div class="row">
  						<div class="col-xs-2">*&nbsp;Total&nbsp;cost</div>
   						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="totalCost" id="totalCost" placeholder="CNY" onkeyup="IsFloat(this);"onchange="this.value=AngelMoney(this.value)" ng-model="money1" />
   							
   									<span class="input-group-addon">CNY</span>
   							
							</div>
						</div>   					
   						<div class="col-xs-2">*&nbsp;Company&nbsp;cover</div>
   							<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm"  name="companyCover" id="companyCover" placeholder="CNY" onkeyup="IsFloat(this);" onchange="this.value=AngelMoney(this.value)" ng-model="money2" />
   								<span class="input-group-addon">CNY</span>
   							</div>
  						</div>
  					</div>
	  				<div class="row">
   						<div class="col-xs-2">*&nbsp;Training&nbsp;period</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="trainingPeriodFrom"  id="datetimepicker3" readonly="true" style="background-color:white;" ng-model="time1"/>
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text" class="form-control input-sm" name="trainingPeriodTo" id="datetimepicker4" readonly="true" style="background-color:white;" ng-model="time2"/>
   							</div>
   						</div>
   						<div class="col-xs-1">*&nbsp;Set&nbsp;period</div>
   						<div class="col-xs-2">
   							<div class="input-group">
   								<input type="text" class="form-control  input-sm" name="setPeriod"  ng-model = "period.time" id="setPeriod" readonly="true" style="background-color:white;"/>
   								<div class="input-group-btn">
                					<button data-toggle="dropdown"  type="button"  class="btn btn-default dropdown-toggle" ><span class="caret"></span></button>
                					<ul class="dropdown-menu dropdown-menu-right" role="menu">
                  						<li ng-repeat="per in periodtype" ng-click="setPeriod(per.time,per.value)"><a href="javascript:void(0);">{{per.time}}</a></li>
                					</ul>
                				</div>
   							</div>
   						</div>
   					</div>  			
   					<div class="row">
   						<div class="col-xs-2">*&nbsp;Service&nbsp;period</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text"  name="servicePeriodFrom" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{getthedate()}}" />
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text"  name="servicePeriodTo" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{gettheMonth()}}"/>
   							</div>
   						</div>
   								
   					</div>
   					<div class="row">
   						<div class="col-xs-2">Reason</div>
   						<div class="col-xs-8"><textarea class="form-control input-sm"  name="reason" ng-model="reason" style="resize:none;" maxlength="500"  rows="4" cols="20"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left()"></span> characters remaining.
   							</div>
   						</div>
   					</div>
   					<div class="row" style="margin-top: 15px;margin-bottom:5px">
   						<div class="btn-group col-xs-8">
   						</div>
   						<div class="btn-group col-xs-1" style="margin-left: -5px;">
   							<button type="button" class="btn btn-default" ng-click="saveAsEmployee()" style="padding:5px 5px;">&nbsp;&nbsp;save&nbsp;&nbsp;</button>
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" ng-click="submitAsEmployee()" style="padding:5px 5px;">submit</button>
   						</div>
   					</div>			
		 		</form>	
			</div>
		</div>
		
		
	</div>
</div>
	

	
<script src="./js/addAsEmployee.js"></script>
<script src="./js/addAsAdmin.js"></script>
<script src="./js/method.js"></script>
</body>
</html>
