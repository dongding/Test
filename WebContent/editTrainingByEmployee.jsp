<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page import="java.util.List"%>
<script src="./js/jquery.datetimepicker.js"></script>
		<!-- content employee -->
		<div style="margin-left: 110px; margin-top:15px;  display: none;" id="employeeeditform" class="agreementview">
			<div class="row"  style="display:{{checkDisplay()}}; margin-top:5px;margin-buttom:0px;">			
				<div class="alert alert-warning" role="alert" style="margin-bottom:0px;  ">
					<strong>Warning!</strong> {{showMsg}}		
				</div>	
			</div>
			<div class="row" style="margin-top:0px;margin-left: 30px; padding-top: 0xp;">
				<!-- form -->
				<form class="form-horizontal" method="post" id="saveEmp" name="saveEmp" role="form" action="" style="margin-top: 0px;">
					<input name="dataId" type="hidden" id="editdataId" value="{{newapplications.dataId}}"/> 
					<input name="status" type="hidden" id="editdataId1" value="{{newapplications.status}}"/> 
					<div class="row" style="margin-top: 0px;"> 						
  						<div class="col-xs-2" style="margin-left:1px" >*&nbsp;Applicant</div>
		 				<div class="col-xs-3">{{newapplications.empName}}</div>
		 				<div class="col-xs-2">*&nbsp;Employee&nbsp;ID</div>
  						<div class="col-xs-3">{{newapplications.empId}}</div>
  					</div>
		  					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Approver</div>
   						<div class="col-xs-3">
   							<div class="input-group">
  								<input type="text" class="form-control input-sm"  name="approver" ng-model="approver" placeholder="Vernon.Stinebaker" style="background-color:white;" id="approver" readOnly="true"/>
   								<div class="input-group-btn">
   									<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>
 			 						<ul class="dropdown-menu dropdown-menu-right" role="menu">
    								
    									<li ng-repeat="appro in allappro"><a href="javascript:void(0);" ng-click="setApprover(appro.empName)">{{appro.empName}}</a></li>	
  									</ul>
								</div>
							</div>
						</div>
						<div class="col-xs-2">*&nbsp;CC</div>
   						<div class="col-xs-3">
   							<div class="input-group">
  								<input type="text" class="form-control input-sm"  name="cc" ng-model="cc" id="cc"   placeholder="Fanny.Wang" 
  								style=" background-color:white; white-space:nowrap;text-overflow:ellipsis;
 					-o-text-overflow:ellipsis;overflow: hidden; "title={{cc}}></input>
   								<div class="input-group-btn">
   									<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown"><span class="caret"></span></button>
 			 						<ul class="dropdown-menu dropdown-menu-right" role="menu">
    									
                		                	<li ng-repeat="cc in allcc"><a href="javascript:void(0);" ng-click="setCc(cc.empName)">{{cc.empName}}</a></li>
                	                 	 
  									</ul>
								</div>
							</div>
						</div>
   					</div>
   			
   					
  					<div class="row">
   						<div class="col-xs-2">*&nbsp;Training&nbsp;program</div>
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
   						<div class="col-xs-2">&nbsp;&nbsp;Reason</div>
   						<div class="col-xs-8"><textarea class="form-control input-sm"  name="reason" ng-model="reason" style="resize:none;" maxlength="500"  rows="3" cols="20"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left()"></span> characters remaining.
   							</div>
   						</div>
   					</div>
   					<div class="row" style="margin-top: 15px;">
   						<div class="btn-group col-xs-7">
   						</div>
   						<div class="btn-group col-xs-1" style="margin-left: -5px;">
   							<button type="button" class="btn btn-default" ng-click="saveAsEmployee()" style="padding:5px 5px;">&nbsp;&nbsp;save&nbsp;&nbsp;</button>
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" ng-click="submitAsEmployee()" style="padding:5px 5px;">submit</button>
   						</div>
   						<div class="btn-group col-xs-1">
   							<button type="button" class="btn btn-default" onclick="editcancel()" style="padding:5px 5px;">&nbsp;cancel&nbsp;</button>
   						</div>
   					</div>			
		 		</form>	
			</div>
		</div>
		<script>
function editcancel(){
	$(".bar").text("List");
	$('#empeditpage').css("display","none");
	$('#selecttab').children().not($('#selecttab').children().eq(0)).removeClass('active');
	$('#selecttab').children().eq(0).addClass('active');
	
	
	$('.agreementview').css("display","none");
	$('.agreementview').eq(0).css("display","block");
}
</script>
<script src="./js/method.js"></script>

