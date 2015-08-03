<%@page import="com.BiShe.bean.Employee"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.List"%>

<script src="./js/bootstrap.min.js"></script>	
		<!-- content employee -->
		<div style="margin-left: 110px;margin-top:15px" id="employeeform" ng-controller="addAsEmployee" class="agreementview">
			<div class="row"  style="display:{{checkDisplay()}}; margin-top:5px;margin-buttom:0px;">			
				<div class="alert alert-warning" role="alert" style="margin-bottom:0px;  ">
					<strong>Warning!</strong> {{showMsg}}		
				</div>	
			</div>
			<div class="row" style="margin-top:8px;margin-left: 30px;">
				<!-- form -->
				<form class="form-horizontal" method="post" id="saveEmp" name="saveEmp" role="form" action="">
					
					<input name="tempId" value="${requestScope.tempId}" id="tempId" type="hidden" />
					<s:hidden name="dataId" value="%{model.dataId}"></s:hidden>
					<div class="row"> 						
  						<div class="col-xs-2" style="margin-left:1px" >*&nbsp;姓名</div>
		 				<div class="col-xs-3">${user.empName}</div>
		 				<div class="col-xs-2">*&nbsp;编号</div>
  						<div class="col-xs-3">${user.empId}</div>
  					</div>		  					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;审批人</div>
   						<div class="col-xs-3">
   							
   									<input type="text"  data-toggle="dropdown" class="form-control input-sm"  name="approver" ng-model="approver" placeholder="Cindy" ng-click="{{getAppprover()}}" style="background-color:white;" id="approver" readOnly="true"/>
                					<ul class="col-xs-11 dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="appro in Infomation1 | filter:{empName:approver}" ng-click="setApprover(appro.empName)"><a href="javascript:void(0);">{{appro.empName}}</a></li>
                					</ul>
							
						</div>
						<div class="col-xs-2">*&nbsp;抄送人</div>
   						<div class="col-xs-3">
   								<input type="text"  data-toggle="dropdown" class="form-control input-sm" placeholder="Eve;" ng-click="{{getInfo()}}" ng-change="bingCC()" value="" ng-model="cc" id="cc" name="cc"/>
                				<input type="hidden" class="form-control input-sm" placeholder="Fanny.Wang;" value="{{ccLast}}" ng-model="ccLast" id="ccLast" name=""/>
                					<ul class="col-xs-11 dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="info in Infomation | filter:{empName:ccLast}" ng-click="setCc(info.empName)"><a href="javascript:void(0);">{{info.empName}}</a></li>
                					</ul>
						</div>
   					</div>
   			
   					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;培训项目</div>
   						<div class="col-xs-8">
   							
   							
  							<input type="text"  class="form-control input-sm " id="trainingProgram" data-toggle="dropdown" ng-onfocus="{{getAllTrainingProgram()}}" name="trainingProgram" value="%{application.trainingProgram }" ng-model="program" ng-change="change()" style="background-color:white;"/>
 			 			       <ul class="col-xs-12 dropdown-menu dropdown-menu-left " role="menu" aria-labelledby="trainingProgram" style="max-height:250px;overflow-y:scroll;">
		    					       <li ng-repeat="per in all | filter:{programName:program}" ng-click="setProgram(per.programName)">
		    					         <a href="javascript:void(0);">{{per.programName}}</a>
		    					       </li> 
  							   </ul>
								
							
						</div>
   					</div>
  					<div class="row">
  						<div class="col-xs-2">*&nbsp;总费用</div>
   						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="totalCost" id="totalCost" placeholder="CNY" onkeyup="IsFloat(this);"onchange="this.value=AngelMoney(this.value)" ng-model="money1" />
   							
   									<span class="input-group-addon">CNY</span>
   							
							</div>
						</div>   					
   						<div class="col-xs-2">*&nbsp;公司承担费用</div>
   							<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm"  name="companyCover" id="companyCover" placeholder="CNY" onkeyup="IsFloat(this);" onchange="this.value=AngelMoney(this.value)" ng-model="money2" />
   								<span class="input-group-addon">CNY</span>
   							</div>
  						</div>
  					</div>
	  				<div class="row">
   						<div class="col-xs-2">*&nbsp;培训时间</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" name="trainingPeriodFrom"  id="datetimepicker3" readonly="true" style="background-color:white;" ng-model="time1"/>
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text" class="form-control input-sm" name="trainingPeriodTo" id="datetimepicker4" readonly="true" style="background-color:white;" ng-model="time2"/>
   							</div>
   						</div>
   						<div class="col-xs-1">*&nbsp;时长</div>
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
   						<div class="col-xs-2">*&nbsp;服务时间</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text"  name="servicePeriodFrom" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{getthedate()}}" />
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text"  name="servicePeriodTo" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{gettheMonth()}}"/>
   							</div>
   						</div>
   								
   					</div>
   					<div class="row">
   						<div class="col-xs-2">&nbsp;&nbsp;理由</div>
   						<div class="col-xs-8"><textarea class="form-control input-sm"  name="reason" ng-model="reason" style="resize:none;" maxlength="500"  rows="3" cols="20"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left()"></span> /500
   							</div>
   						</div>
   					</div>
   					<div class="row" style="margin-top: 15px;margin-bottom:5px">
   						<div class="btn-group col-xs-8">
   						</div>
   						<div class="btn-group col-xs-1" style="margin-left: -5px;">
   							<button type="button" class="btn btn-default" ng-click="saveAsEmployee()" style="padding:5px 5px;">保存&nbsp;</button>
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" ng-click="submitAsEmployee()" style="padding:5px 5px;">提交</button>
   						</div>
   					</div>			
		 		</form>	
			</div>
		</div>

<script src="./js/method.js"></script>