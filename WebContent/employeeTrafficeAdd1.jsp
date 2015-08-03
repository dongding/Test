<%@page import="com.BiShe.bean.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.List"%>
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/fatheremp.js"></script>   
<script src="./js/addAsEmployee.js"></script>
<script src="./js/bootstrap.min.js"></script>	
<body style="container-fluid" onselectstart="return false;">
	<div class="row">
		<div class="col-xs-12" style="font-size:13px">
		    <ul class="breadcrumb"  style="padding-left: 30px;" id="breadcrumb">
    			<li><a href="#">Training&nbsp;Tracking</a></li>
    			<li><a href="#">AddTraining</a></li>
    			<li><a href="employeeTrafficeAdd.jsp">AddTraffic</a></li>
    		</ul>
		</div>
	</div>
	<div class="row bs-docs-example" id="examp">		
		<div ng-app="" class="col-xs-12">
		
	<div ng-controller="fatheremp">		
		<div  style="display: block;"  id="employeeList">

		<!-- content employee -->
		<div style="margin-left: 110px;margin-top:15px" id="employeeform" ng-controller="addAsEmployee" class="agreementview">
			<div class="row"  style="display:{{checkDisplay()}}; margin-top:5px;margin-buttom:0px;">			
				<div class="alert alert-warning" role="alert" style="margin-bottom:0px;  ">
					<strong>Warning!</strong> {{showMsg}}		
				</div>	
			</div>
			<div class="row" style="margin-top:8px;margin-left: 30px;">
				<!-- form -->
				<form class="form-horizontal" method="post" id="saveTra" name="saveTra" role="form" action="">
					
					<input name="tempId" value="${requestScope.tempId}" id="tempId" type="hidden" />
					<s:hidden name="dataId" value="%{model.dataId}"></s:hidden>
					<div class="row"> 						
  						<div class="col-xs-2" style="margin-left:1px" >*&nbsp;Applicant</div>
		 				<div class="col-xs-3">${user.empName}</div>
		 				<div class="col-xs-2">*&nbsp;Employee&nbsp;ID</div>
  						<div class="col-xs-3">${user.empId}</div>
  					</div>		  					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Approver</div>
   						<div class="col-xs-3">
   							<div class="input-group">
  								<input type="text"  data-toggle="dropdown" class="form-control input-sm"  name="approver" ng-model="approver" placeholder="Cindy" ng-click="{{getAppprover()}}" style="background-color:white;" id="approver" readOnly="true"/>
   								<input type="hidden" class="form-control input-sm" placeholder="Eve;" value="{{ccLast}}" ng-model="ccLast" id="ccLast" name=""/>
                					<ul class="col-xs-11 dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="approver in Infomation1 | filter:{empName:ccLast}" ng-click="setApprover(approver.empName)"><a href="javascript:void(0);">{{approver.empName}}</a></li>
                					</ul>
							</div>
						</div>
						<div class="col-xs-2">*&nbsp;CC</div>
   						<div class="col-xs-3">
   								<input type="text"  data-toggle="dropdown" class="form-control input-sm" placeholder="Eve;" ng-click="{{getInfo()}}" ng-change="bingCC()" value="" ng-model="cc" id="cc" name="cc"/>
                				<input type="hidden" class="form-control input-sm" placeholder="Eve;" value="{{ccLast}}" ng-model="ccLast" id="ccLast" name=""/>
                					<ul class="col-xs-11 dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="Infomation in Infomation | filter:{empName:ccLast}" ng-click="setCc(Infomation.empName)"><a href="javascript:void(0);">{{Infomation.empName}}</a></li>
                					</ul>
						</div>
   					</div>
   			
   					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;费用名称</div>
   						<div class="col-xs-3" name="itemname" id="itemname">市内交通费</div>
   					</div>
   						<div class="row">
  						<div class="col-xs-2">*&nbsp;出发地</div>
   						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="fromplace" id="fromplace"  ng-model="place1" />
							</div>
						</div>   					
   						<div class="col-xs-2">*&nbsp;目的地</div>
   							<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm"  name="toplace" id="toplace"  ng-model="place2" />
   							</div>
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
   						<div class="col-xs-2">*&nbsp;时间</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="itemdate"  id="datetimepicker3" readonly="true" style="background-color:white;" ng-model="time1"/>
   							</div>
   						</div>
   						</div>
   					
   					<div class="row" style="margin-top: 15px;margin-bottom:5px">
   						<div class="btn-group col-xs-8">
   						</div>
   						<div class="btn-group col-xs-1" style="margin-left: -5px;">
   							<button type="button" class="btn btn-default" ng-click="saveAsTraffic()" style="padding:5px 5px;">&nbsp;&nbsp;save&nbsp;&nbsp;</button>
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" ng-click="submitAsTraffic()" style="padding:5px 5px;">submit</button>
   						</div>
   					</div>			
		 		</form>	
			</div>
		</div>

<script src="./js/method.js"></script>
</div>
	</div>
	</div>
	</div>
</body>