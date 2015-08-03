<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"> 
<script src="./js/jquery.nicescroll.js"></script>
<style>
.title_0{
	display: none;
}
</style>
 <div style="display: block;" class="agreementview">
    
    <div class="row"  style="display:{{checkState()}}; margin-top:5px;margin-buttom:0px;">			
		<table id="test" style="display:none">
				<thead>
					<tr>
						<th style="width:10%" >Employee ID</th>
						<th style="width:9%">Applicant</th>
						<th style="width:9%">Chinese name</th>
						<th style="width:9%">Identification</th>
						<th style="width:12%">Training program</th>
						<th style="width:12%">Training start</th>
						<th style="width:12%">Training end</th>
						<th style="width:9%">Total cost</th>
						<th style="width:14%">Company cover</th>
						<th style="width:14%">Set period</th>
						<th style="width:11%">Service start</th>
						<th style="width:11%">Service end</th>
						<th style="width:14%">Service Status</th>
					</tr>
				</thead>
				<tbody id="trs">
					
				</tbody>
			</table>
			</div>
			
			
			<table  class="table" style="background-color:#ffffff; margin-bottom: 0px;">
				<thead id="theadadmin">
					<tr>
					<th><input type="checkbox" name="allChecked" id="allChecked" ng-click="selectAll()"/></th>
						<th id="id_th"><div  ng-click="f = 'empId'; rev1 = !rev1"  style="font-size:12px;text-align: center;">Employee ID</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.empIdFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="ap_th"><div  ng-click="f = 'empName'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Applicant</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.empNameFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="pro_th"><div  ng-click="f = 'trainingProgram'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Training Program</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.trainingProgramFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="tot_th" ><div  ng-click="f = 'totalCost'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Total cost</div><div><input class="form-control input-sm" style="height: 22px;"ng-model="myfilter.totalCostFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="com_th"><div  ng-click="f = 'companyCover'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Company cover</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.companyCoverFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="sta_th"><div  ng-click="f = 'servicePeriodFrom'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Service start</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodFromFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="end_th"><div  ng-click="f = 'servicePeriodTo'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Service end</div><div><input  class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodToFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="stat_th"><div  ng-click="f = 'status'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Status</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.statusFilter" ng-change="moveTheDiv()"></input></div></th>

						<th id="icon_th"><div class="row" style="width: 50px;margin-left: 2px;"><div title="Refresh" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-240px -24px; height: 18px; width: 18px;float: left; margin-right: 4px;" ng-click="refresh()"></div>
						
						<div title="Export"style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-117px -73px; height: 18px; width: 18px;float: left; " ng-click="exportexel()"></div>
					</div>
						</th>
					</tr>
				</thead>
			</table>
			<div id="tbodyadmin" style="overflow: hidden;">
			<table class="table"  style="overflow: hidden;">
				<tbody>					
					<tr ng-repeat="member in applications | MyOrderBy: f : rev1 | MyFilter: myfilter" 
						ng-class-odd="'odd'" ng-class-even="'even'" class="admin" id="{{member.dataId}},"  style="text-align: center;">
					<td style="text-align: left;" ><input type="checkbox" name="choose" class="checkbox"  ng-model="member.selected" id="{{member.dataId}},"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.empId"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.empName">
 			</td>
						<td style="font-size:13px;text-align: left;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ><p style="width:180px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden; "title={{member.trainingProgram}} ng-bind="member.trainingProgram" >
 			</p></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.totalCost"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.companyCover"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.servicePeriodFrom "></td>						
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.servicePeriodTo"></td>						
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.status"></td>
						<td><a title="Agreement"style="cursor:pointer;background-repeat:no-repeat;background-image:url('img/glyphicons-halflings{{member.hasCertification}}.png'); background-position:-23px -24px; height: 16px; width: 16px;float: left;" ng-click="checkAgreement(member.hasCertification,member.dataId)" ></a></td>
		
					</tr>
				</tbody>
			</table>		
			</div>
			<div id="count1"
				style=" height: 20px; width: 150px;margin-top: 10px;">
			</div>
	
			
			<div style="display: none; border-style: solid; background-color: #f5f5f5; border-width:0px 0px" id="admindetail">
		<div style="margin-left:100px;margin-right: 60px;">
		
		<div class="row" style="margin-top:0px;margin-left: 30px;">

   					<div class="row">
   						<div class="col-xs-12">Training&nbsp;program&nbsp;:&nbsp;&nbsp;<span style="width:500px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden; " title={{selapplication.trainingProgram}} ng-bind="selapplication.trainingProgram">
 			</span></div>
   						<!--<div class="col-xs-8" style="font-size:14px">{{selapplication.trainingProgram }}</div>-->
					</div>
					<div class="row">
   						<div class="col-xs-6" >Employee&nbsp;ID&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.empId">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >Applicant&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.empName" >
 			</span></div>
   						
   					</div>
					<div class="row">
   						<div class="col-xs-6" >Chinese&nbsp;name&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.chineseName">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >ID&nbsp;number&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.identification" >
 			</span></div>
   						
   					</div>
  					
  					<div class="row">
   						<div class="col-xs-6" >Approver&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.approver">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >CC&nbsp;:&nbsp;&nbsp;<span style="width:230px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;" title={{selapplication.cc}} ng-bind="selapplication.cc" >
 			</span></div>
   						
   					</div>
  					<div class="row">
  						<div class="col-xs-6" >Total&nbsp;cost&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.totalCost"  ></span><span>&nbsp;CNY</span></div>
   						   					
   						<div class="col-xs-6">Company cover&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.companyCover"  ></span><span>&nbsp;CNY</span></div>
   						
  					</div>
	  				<div class="row">
   						<div class="col-xs-6" >Training&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.trainingPeriodFrom" ></span><span>&nbsp;~&nbsp;</span> <span ng-bind="selapplication.trainingPeriodTo"></span></div>
   						<div class="col-xs-6" >Set&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.setPeriod" ></span></div>
   						
   					</div>  			
   					<div class="row">
   						<div class="col-xs-6" >Service&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.servicePeriodFrom" ></span><span>&nbsp;~&nbsp;</span><span ng-bind="selapplication.servicePeriodTo"></span></div>
   						<div class="col-xs-6" >Training organization&nbsp;:&nbsp;&nbsp;<span  style="width:230px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;" title={{selapplication.trainingInstitution}} ng-bind="selapplication.trainingInstitution";>
 			</span></div>
   					</div>
   					<div class="row">
   						<div class="col-xs-11">Reason:&nbsp;&nbsp;<span style="word-break:break-all;width:590px;" ng-bind="selapplication.reason"; >
 			</span></div>
   							<!--<div class="col-xs-8" style="font-size:12px">{{selapplication.reason }}</div>
   							
   							-->			
   						</div>
   										
   						<div class="row title_{{selapplication.rejected}}">
   						<div class="col-xs-2 now_disapproved">
   							Reject notes&nbsp;:
   					  </div>	
   					  					
   							<div class=" col-xs-4 " style="width:425px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;margin-left:-50px " title={{selapplication.rejectNotes}} ng-bind="selapplication.rejectNotes">
 	
   							</div>
   							<!-- show more reject notes -->
   							<input type="hidden" value="{{selapplication.dataId}}" id="dataIdtemp">
   							<div style="background-image:url('img/more7.gif'); background-repeat:no-repeat;cursor:pointer;height:12px;width:6px;margin-top:6px" class="col-xs-1  " onmouseover="history1('bb', 'show');" ></div>				
							<!-- show more reject notes -->
   						</div> 						
   				<div class="row label_{{selapplication.status}}"style="display:none;text-align:left;z-index:999;" id="bb" onmouseover="history('bb', 'show');" onmouseout="history('bb', 'hide');">
   						<div class="col-xs-1" style="margin-top:4px">
   						
   						
   						</div>
   						<div class="col-xs-11"> 
							<table  class="table "  border="0" > 						
							<tbody style="display: block; height:auto;max-height:100px;overflow-x:hidden;overflow-y:auto;background-color:#f5f5f5" id="tbody" >						
							 </tbody>
							</table>
							</div>  						
   				</div>	
   						 <div class="row title_{{selapplication.commented}}">
   						<div class="col-xs-2 now_disapproved">
   							Comments&nbsp;:
   					  </div>	
   					  					
   							<div class=" col-xs-4 " style="width:425px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;margin-left:-50px " title={{selapplication.comments}} ng-bind="selapplication.comments">
 	
   							</div>
   							<!-- show more reject notes -->
   							<input type="hidden" value="{{selapplication.dataId}}" id="dataIdtemp3">
   							<div style="background-image:url('img/more7.gif'); background-repeat:no-repeat;cursor:pointer;height:16px;margin-top:6px;width:6px;" class="col-xs-1 " onmouseover="history3('ee', 'show');" ></div>				
							<!-- show more reject notes -->
   						</div> 						
   				<div class="row "style="display:none;text-align:left;z-index:999;" id="ee" onmouseover="history('ee', 'show');" onmouseout="history('ee', 'hide');">
   						<div class="col-xs-1" style="margin-top:4px">
   						
   						
   						</div>
   						<div class="col-xs-11"> 
							<table  class="table "  border="0" > 						
							<tbody style="display: block; height:auto;max-height:100px;overflow-x:hidden;overflow-y:auto;background-color:#f5f5f5" id="tbody3" >						
							 </tbody>
							</table>
							</div>  						
   				</div>	
   					<div class="row">
   					<div class="col-xs-10"></div>
   					<div class="col-xs-2" style="font-size:14px; padding-left: 55px;"><div title="Edit"class="emp_{{selapplication.status}}" style="background-repeat:no-repeat; background-position:0px -73px; height: 18px; width: 18px;float: left;" ng-click="beginedit(selapplication.status)"></div>
																							<div title="Delete" class="adm_{{selapplication.status}}"style="background-repeat:no-repeat; background-position:-456px -0px; height: 18px; width: 18px;float: left;" ng-click="begindelete(selapplication.dataId,selapplication.status)"></div>
																							<div title="Add Comments" style="background-image:url('img/glyphicons-halflings.png');cursor:pointer;background-repeat:no-repeat; background-position:-21px -48px; height: 18px; width: 18px;margin-left:-25px" ng-click="showComments()"></div>
   						
   																						</div>
   					</div>	
   					
   					<div>	
   					<div class="row">																						
					<!-- comments start -->
			
				<div class="row" id="commentsDiv" style="display:none;z-index=999;margin-top: -25px;">

   						<div class="col-xs-2"style="margin-left:15px "></div>
   						<div class="col-xs-8"style="margin-left:-55px "><textarea class="form-control input-sm" placeholder="You can input some comments."  ng-model="comments" style="resize:none;" maxlength="200"  rows="3" cols="20"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left2()"></span> characters remaining.
   				
   							</div>
   						</div>
   						<div title="Submit" ng-click="commentsByAdmin(selapplication.dataId)" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-142px -73px; height: 18px; width: 16px;float:left;margin-top:40px"></div>
				
   					</div>
			
			<!-- comments end  -->
   					</div>	
   					
   					<div class="row" style="margin-top: 5px;"></div>
   						</div>  	
   					</div>	
   					</div>
   	</div>
</div>
   	<script type="text/javascript">
	
	$('#id_th').width($('#id_th').width()-23);
	$('#ap_th').width($('#ap_th').width()-1);
	$('#tot_th').width($('#tot_th').width()-5);
	$('#com_th').width($('#com_th').width()-5);
	$('#sta_th').width($('#sta_th').width()-5);
	$('#end_th').width($('#end_th').width()-5);
	$('#stat_th').width($('#stat_th').width()-30);
	$('#pro_th').width($('#pro_th').width()+40);
	$('#icon_th').width($('#pro_th').width()-140);
   	for(var i=0;i<$('#theadadmin').children().children().size();i++){   
		//alert($('#theadadmin').children().children().eq(i).width());
		$('#tbodyadmin').children().children().children().children().eq(i).width($('#theadadmin').children().children().eq(i).outerWidth());;
		//alert($('#thodyadmin').children().children().eq(i).width());
	}

</script>
   	
