<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.List"%>
<script src="./js/jquery.datetimepicker.js"></script>
		<!-- content employee -->
		<div style="margin-left: 110px; display: none;margin-top:15px" id="admineditform" class="agreementview">
			<div class="row"  style="display:{{checkDisplay()}}; margin-top:5px;margin-buttom:0px;">			
				<div class="alert alert-warning" role="alert" style="margin-bottom:0px;  ">
					<strong>Warning!</strong> {{showMsg}}		
				</div>	
			</div>
			<div class="row" style="margin-top:0px;margin-left: 30px; padding-top: 0xp;">
				<!-- form -->
				<form class="form-horizontal" method="post" id="saveAdmin" name="saveEmp" role="form" action="">
					<input name="dataId" type="hidden" id="editdataId" value="{{newapplications.dataId}}"/> 
					<div class="row">
					<div class="col-xs-2">*&nbsp;Applicant</div>
  						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" data-toggle="dropdown" class="form-control input-sm" placeholder="Applicant" ng-click="getInfo()"  ng-model="applicant" id="applicant" name="empName"/>
                					<ul class="dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="Infomation in Infomation | filter:{empName:applicant}" ng-click="setapplicant(Infomation.empName)"><a href="javascript:void(0);">{{Infomation.empName}}</a></li>
                					</ul>
                				
   							</div>
   						</div>
  						<div class="col-xs-2">*&nbsp;Employee&nbsp;ID</div>
		 				<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" data-toggle="dropdown" class="form-control input-sm" placeholder="Employee ID" ng-click="getInfo()"  ng-model="empId" id="empId" name="empId"/>
   								
                					<ul class="dropdown-menu dropdown-menu-right" role="menu" style="max-height:250px;overflow-y:scroll;">
                  						<li ng-repeat="Infomation in Infomation | filter:{empId:empId}" ng-click="setempId(Infomation.empId)"><a href="javascript:void(0);">{{Infomation.empId}}</a></li>
                					</ul>
   							</div>
   						</div>
  						
  					</div>
  					<div class="row">
   					<div class="col-xs-2">*&nbsp;Chinese&nbsp;name</div>
   					<div class="col-xs-3">  						
   								<input type="text" class="form-control input-sm" name="chineseName" id="chineseNameAdmin" ng-model="chineseName" />
   							
   					</div>
   					<div class="col-xs-2">*&nbsp;ID&nbsp; number</div>
   					<div class="col-xs-3">  						
   								<input type="text" class="form-control input-sm" name="identification" id="idNumber"  ng-model="idNumber" maxlength="18"/>
   							
   					</div>
   					</div>
  					<div class="row">
  						<div class="col-xs-2">*&nbsp;Total&nbsp;cost</div>
   						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" placeholder="CNY" onkeyup="IsFloat(this);"onchange="this.value=AngelMoney(this.value)" ng-model="money1" id="money1" name="totalCost" value="${application.totalCost}"/>   							
   								<span class="input-group-addon">CNY</span>
   							</div>
						</div>   					
   						<div class="col-xs-2">*&nbsp;Company&nbsp;cover</div>
   						<div class="col-xs-3">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" placeholder="CNY" onkeyup="IsFloat(this);"onchange="this.value=AngelMoney(this.value)" ng-model="money2" id="money2" name="companyCover" value="${application.companyCover }"/>
   								<span class="input-group-addon">CNY</span>   							
							</div>
  						</div>
  					</div>
  					
  						<div class="row">
   					<div class="col-xs-2">*&nbsp;Training organization</div>
   					<div class="col-xs-8">  						
   								<input type="text" class="form-control input-sm" name="trainingInstitution" id="trainingOrgnization" ng-model="trainingOrgnization"  />
   							
   					</div>
   					</div>
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Training&nbsp;program</div>
   						<div class="col-xs-8">
   							<input type="text"  class="form-control input-sm " id="trainingProgram_admin" data-toggle="dropdown" ng-onclick="{{getProgram()}}" name="trainingProgram"  ng-model="program"  style="background-color:white;"/>
 			 			<ul class="dropdown-menu dropdown-menu-left " role="menu" aria-labelledby="trainingProgram" style="max-height:250px;overflow-y:scroll;">
    					<li ng-repeat="per in program1 | filter:{programName:program}" ng-click="setProgram(per.programName)"><a href="javascript:void(0);">{{per.programName}}</a></li> 
  						</ul>

						</div>
					</div> 			
   					<div class="row">
   						<div class="col-xs-2">*&nbsp;Training&nbsp;period</div>
   						<div class="col-xs-5">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" id="datetimepicker1" readonly="true" style="background-color:white;" ng-model="time1" name="trainingPeriodFrom" />
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text" class="form-control input-sm" id="datetimepicker2" readonly="true" style="background-color:white;" ng-model="time2" name="trainingPeriodTo" />
   							</div>
   						</div>
   						<div class="col-xs-1">*&nbsp;Set&nbsp;period</div>
   						<div class="col-xs-2">
   							<div class="input-group">
   								<input type="text" class="form-control  input-sm"  ng-model = "period.time" name="setPeriod"  id="period" readonly="true" style="background-color:white;"/>
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
   								<input type="text" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{getthedate()}}" name="servicePeriodFrom"/>
   								<span class="input-group-addon" style="border: 0px;">-</span>
   								<input type="text" class="form-control input-sm" readonly="true" style="background-color:white;"  value="{{gettheMonth()}}" name="servicePeriodTo"/>
   							</div>
   						</div>
   					</div>
   				<div class="row">
   						<div class="col-xs-2">*&nbsp;Status</div>
   						<div class="col-xs-3" style="z-index:999">
   							<div class="input-group">
   								<input type="text" class="form-control input-sm" id="status" ng-model="status" name="status" readonly="true" style="background-color:white;"/>
   								<div class="input-group-btn">
                					<button data-toggle="dropdown"  type="button"  class="btn btn-default dropdown-toggle" ><span class="caret"></span></button>
                					<ul class="dropdown-menu dropdown-menu-right" role="menu">
                  						<li ng-repeat="sta in statustype" ng-click="setStatus(sta.sta)"><a href="javascript:void(0);">{{sta.sta}}</a></li>
                					</ul>
                				</div>
   							</div>
   						</div>
   					</div>
   					<div class="row">
   						<div class="col-xs-2">Reason</div>
   							<div class="col-xs-8"><textarea class="form-control input-sm" ng-model="reason" style="resize:none;" maxlength="500"  rows="4" cols="20" name="reason"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left()"></span> characters remaining.</div>
   						</div>   				
   					</div>
   					
   					<div class="row" style="margin-top: 15px;">
   						<div class="btn-group col-xs-7">
   							</div>
   						<div class="btn-group col-xs-1" style="margin-left: -5px;">
   							<button type="button" class="btn btn-default" ng-click="saveAsAdmin()" style="padding:5px 5px;">&nbsp;&nbsp;save&nbsp;&nbsp;</button>
<!--   							<s:submit action="adminAction_saveByAdmin" value="save"></s:submit>-->
   						</div>
   						<div class="btn-group col-xs-1" style="margin-left: 0px;">
   							<button type="button" class="btn btn-default" ng-click="submitAsAdmin()" style="padding:5px 5px; ">submit</button>
<!--   							<s:submit action="adminAction_submit" value="submit"></s:submit>-->
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" onclick="admineditcancel()" style="padding:5px 5px;">&nbsp;cancel&nbsp;</button>
   						</div>
   					</div>
		 		</form>	
			</div>
		</div>
		<script>
		function admineditcancel(){
			document.getElementById("bar").innerHTML="List";
			$('#admineditpage').css("display","none");
			$('#selecttab').children().not($('#selecttab').children().eq(0)).removeClass('active');
			$('#selecttab').children().eq(0).addClass('active');
			
			
			$('.agreementview').css("display","none");
			$('.agreementview').eq(0).css("display","block");
		}
</script>
<script src="./js/method.js"></script>