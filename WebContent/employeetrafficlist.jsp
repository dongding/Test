<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<script src="./js/jquery.nicescroll.js"></script>
<style>
.title_0{
	display: none;
}
</style>
	<div style="display: none;" id="employee" class="agreementview">
	
			<table  class="table"  style="background-color:#ffffff; margin-bottom: 0px;">				
				
				<thead id="theademployee" >
					<tr style="text-align: center;">
					<th><input type="checkbox" name="allChecked" id="allChecked" onclick=
		"SelectAll();"/></th>						
						<th id="th_pro"><div  ng-click="f = 'trainingProgram'; rev1 = !rev1" style="font-size:12px;text-align: center;">Training program</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.trainingProgramFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="th_tot"><div  ng-click="f = 'totalCost'; rev1 = !rev1" style="font-size:12px;text-align: center;">Total cost</div><div><input class="form-control input-sm" style="height: 22px;"ng-model="myfilter.totalCostFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="th_com"><div  ng-click="f = 'companyCover'; rev1 = !rev1" style="font-size:12px;text-align: center;">Company cover</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.companyCoverFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="th_sta"><div  ng-click="f = 'servicePeriodFrom'; rev1 = !rev1" style="font-size:12px;text-align: center;">Service start</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodFromFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="th_end"><div  ng-click="f = 'servicePeriodTo'; rev1 = !rev1" style="font-size:12px;text-align: center;">Service end</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodToFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="th_stat"><div  ng-click="f = 'status'; rev1 = !rev1" style="font-size:12px;text-align: center;">Status</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.statusFilter" ng-change="moveTheDiv()"></input></div></th>

						<th id="th_icon"><div title="Refrsh" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-240px -24px; height: 16px; width: 16px; margin-left: 20px;" ng-click="refresh1()"></div>
						
						</th>
					</tr>
				</thead>
			</table >
			<div id="tbodyemployee" style="overflow: hidden; margin-top: 0px;">
			<table class="table" style="position:relative;">
				<tbody>					
					
	
							<tr class="employee" ng-repeat="member in traffics" id="{{member.dataId}}" style="text-align: center;">
						<td><input type="checkbox" name="choose"></td>
						<td  style="font-size:13px;text-align:left" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)">
							<p style="width:230px; white-space:nowrap;text-overflow:ellipsis;-o-text-overflow:ellipsis;overflow: hidden; "title={{member.itemname}}  ng-bind="member.itemname" id="emptp_{{member.dataId}}">
 								</p></td>
						
                        <td ng-bind="member.totalCost"; style="font-size:13px;" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)"></td>
						<td ng-bind="member.companyCover";style="font-size:13px;" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)"></td>
						<td ng-bind="member.fromplace";style="font-size:13px;" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)"></td>						
						<td ng-bind="member.toplace"; style="font-size:13px;" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)"></td>						
						<td ng-bind="member.status"; style="font-size:13px;" ng-dblclick="showdetail(member.dataId)"  ng-click="focusme(member.dataId)"></td>
 

						<td><a  title="Agreement"style="cursor:pointer;background-image:url('img/glyphicons-halflings{{member.hasCertification}}.png');background-repeat:no-repeat; background-position:-23px -24px; height: 16px; width: 16px;float: left;margin-left:20px" ng-click="checkAgreement(member.hasCertification,member.dataId)" ></a></td>
</tr> 
				</tbody>
			</table>				
			</div>
			<div id="count2"
				style="height: 20px; width: 150px;margin-top: 10px;">
			</div>
			
			
			<div style="display: none; border-style: solid; background-color: #f5f5f5; border-width:0px 0px" id="employeedetail">
		<div style="margin-left:100px;margin-right: 60px;">
			<div class="row" style="margin-top:0px;margin-left: 30px;">

   					<div class="row">
   						<div class="col-xs-12">Training&nbsp;program&nbsp;:&nbsp;&nbsp;<span style="width:500px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden; " title={{selapplication.trainingProgram}}; ng-bind="selapplication.trainingProgram" >
 			</span></div>
   						<!--<div class="col-xs-8" style="font-size:14px">{{selapplication.trainingProgram }}</div>-->
					</div>
					
					<div class="row">
   						<div class="col-xs-6" >Chinese&nbsp;name&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.chineseName">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >ID&nbsp;number&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.identification" >
 			</span></div>
   						
   					</div>
					
					
  					<div class="row">
   						<div class="col-xs-6" >Approver&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.approver">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >CC&nbsp;:&nbsp;&nbsp;<span style="width:230px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;" title={{selapplication.cc}} ng-bind="selapplication.cc" >
 			</span></div>
   						
   					</div>
  					<div class="row">
  						<div class="col-xs-6" >Total&nbsp;cost&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.totalCost" ></span><span>&nbsp; CNY </span></div>
   						   					
   						<div class="col-xs-6">Company cover&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.companyCover" ></span><span>&nbsp; CNY </span></div>
   						
  					</div>
	  				<div class="row">
   						<div class="col-xs-6" >Training&nbsp;period&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.trainingPeriodFrom" ></span><span>&nbsp;~&nbsp;</span><span  ng-bind="selapplication.trainingPeriodTo" > </span></div>
   						<div class="col-xs-6" >Set&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.setPeriod" >&nbsp;&nbsp;</span></div>
   						
   					</div>  			
   					<div class="row">
   						<div class="col-xs-6" >Service&nbsp;period&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.servicePeriodFrom" ></span><span>&nbsp;~&nbsp;</span><span  ng-bind="selapplication.servicePeriodTo" > </span></div>
   						<div class="col-xs-6" >Training organization&nbsp;:&nbsp;&nbsp;<span style="width:230px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;" title={{selapplication.trainingInstitution}} ng-bind="selapplication.trainingInstitution" >
 			</span></div>
   					</div>
   					<div class="row">
   						<div class="col-xs-11">Reason&nbsp;:&nbsp;&nbsp;<span style="word-break:break-all;width:590px;"  ng-bind="selapplication.reason" >
 			</span></div>
   							<!--<div class="col-xs-8" style="font-size:12px">{{selapplication.reason }}</div>
   							
   							-->			
   						</div>
   										
   						<div class="row title_{{selapplication.rejected}}">
   							{{}}
   						<div class="col-xs-2 now_disapproved">
   							Reject notes&nbsp;:
   					  </div>	
   					  					
   							<div class=" col-xs-4 " style="width:425px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;margin-left:-50px " title={{selapplication.rejectNotes}} ng-bind="selapplication.rejectNotes" >
 		
   							</div>
   							<!-- show more reject notes -->
   							<input type="hidden" value="{{selapplication.dataId}}" id="dataIdtemp2">
   							<div style="background-image:url('img/more7.gif'); background-repeat:no-repeat;cursor:pointer;height:16px;margin-top:6px;width:6px;" class="col-xs-1 " onmouseover="history2('dd', 'show');" ></div>				
							<!-- show more reject notes -->
   						</div> 						
   				<div class="row label_{{selapplication.status}}"style="display:none;text-align:left;z-index:999;" id="dd" onmouseover="history('dd', 'show');" onmouseout="history('dd', 'hide');">
   						<div class="col-xs-1" style="margin-top:4px">
   						
   						
   						</div>
   						<div class="col-xs-11" > 
							<table  class="table "  border="0" > 						
							<tbody style="display: block; height:auto;max-height:100100px;overflow-x:hidden;overflow-y:auto;background-color:#f5f5f5" id="tbody2" >						
							 </tbody>
							</table>
							</div>  						
   				</div>	
   				
   						  <div class="row title_{{selapplication.commented}}">
   						<div class="col-xs-2">
   							Comments&nbsp;:
   					  </div>	
   					  					
   							<div class=" col-xs-4 " style="width:425px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;margin-left:-50px " title={{selapplication.comments}} ng-bind="selapplication.comments">
 	
   							</div>
   							<!-- show more reject notes -->
   							<input type="hidden" value="{{selapplication.dataId}}" id="dataIdtemp4">
   							<div style="background-image:url('img/more7.gif'); background-repeat:no-repeat;cursor:pointer;height:16px;margin-top:6px;width:6px;" class="col-xs-1 " onmouseover="history4('ff', 'show');" ></div>				
							<!-- show more reject notes -->
   						</div> 						
   				<div class="row "style="display:none;text-align:left;z-index:999;" id="ff" onmouseover="history('ff', 'show');" onmouseout="history('ff', 'hide');">
   						<div class="col-xs-1" style="margin-top:4px">
   						
   						
   						</div>
   						<div class="col-xs-11"> 
							<table  class="table "  border="0" > 						
							<tbody style="display: block; height:auto;max-height:100px;overflow-x:hidden;overflow-y:auto;background-color:#f5f5f5" id="tbody4" >						
							 </tbody>
							</table>
							</div>  						
   				</div>	
   					<div class="row">
   					<div class="col-xs-10"></div>
   					<div class="col-xs-2" style="font-size:14px; padding-left: 55px;"><div title="Edit"class="emp_{{selapplication.status}}" style="background-repeat:no-repeat; background-position:0px -73px; height: 18px; width: 18px;float: left;" ng-click="beginedit(selapplication.status)"></div>
																							<div title="Delete"class="adm_{{selapplication.status}}"style="background-repeat:no-repeat; background-position:-456px -0px; height: 18px; width: 18px;float: left;" ng-click="begindelete(selapplication.dataId,selapplication.status)"></div>
																								</div>
   					</div>	
   					<div class="row" style="margin-top: 5px;"></div>
   						</div>  	
   					</div>	
   					</div>			
			</div>		
<script>
$('#th_pro').width($('#th_pro').width()+250);
$('#th_sta').width($('#th_pro').width()-80);
$('#th_end').width($('#th_pro').width()-80);
$('#th_tot').width($('#th_pro').width()-80);
$('#th_com').width($('#th_pro').width()-80);
$('#th_stat').width($('#th_pro').width()-160);
$('#th_icon').width($('#th_pro').width()-160);

</script> 
