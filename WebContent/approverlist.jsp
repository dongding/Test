<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="./js/jquery.nicescroll.js"></script>  
<style>
.title_0{
	display: none;
}
</style>  
   <div class="alert alert-warning" role="alert" id="approverWarn"
	style="padding-left: 100px; margin-bottom: 10px; display: none;">
Do you want to approve all the records you choose  ? 
<span style="float: right; margin-right: 20px;" ng-click="donotapprover()">No</span>
<span style="float: right; margin-right: 20px;" ng-click="doapprover()">Yes</span>
</div>

   <div class="alert alert-warning" role="alert" id="disapproverWarn"
	style="padding-left: 100px; margin-bottom: 10px; display: none;">
Do you want to disapprove all the records you choose  ? 
<span style="float: right; margin-right: 20px;" ng-click="donotdisapprover()">No</span>
<span style="float: right; margin-right: 20px;" ng-click="dodisapprover()">Yes</span>
</div>

<div  style="display: block;"  id="approverList" class="agreementview">
		<!-- approver list start -->
		<table  class="table" style="background-color:#ffffff;margin-bottom:0px">
				<thead id="theadapprover">
					<tr>
						<th><input type="checkbox" name="allChecked" id="allChecked" ng-click="selectAll()"/></th>
						<th id="id_th1"><div  ng-click="f = 'empId'; rev1 = !rev1"  style="font-size:12px;text-align: center;">Employee ID</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.empIdFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="ap_th1"><div  ng-click="f = 'empName'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Applicant</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.empNameFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="pro_th1"><div  ng-click="f = 'trainingProgram'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Training Program</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.trainingProgramFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="tot_th1" ><div  ng-click="f = 'totalCost'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Total cost</div><div><input class="form-control input-sm" style="height: 22px;"ng-model="myfilter.totalCostFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="com_th1"><div  ng-click="f = 'companyCover'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Company cover</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.companyCoverFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="sta_th1"><div  ng-click="f = 'servicePeriodFrom'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Service start</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodFromFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="end_th1"><div  ng-click="f = 'servicePeriodTo'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Service end</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.servicePeriodToFilter" ng-change="moveTheDiv()"></input></div></th>
						<th id="stat_th1"><div  ng-click="f = 'status'; rev1 = !rev1"  style="font-size:12px;text-align: center;" >Status</div><div><input class="form-control input-sm" style="height: 22px;" ng-model="myfilter.statusFilter" ng-change="moveTheDiv()"></input></div></th>
						
						<th id="icon_th1"><div class="row" style="width: 50px;margin-left: 2px;"><div title="Refresh" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-240px -24px; height: 18px; width: 18px;float: left; margin-right: 4px;" ng-click="refresh()"></div>											
							</div>
						</th>
						<th id="icon_th2">
						</th>
					</tr>
				</thead>
			</table>
			<div id="tbodyapprover" style="overflow: hidden;margin-top:0px">
			<table class="table" >
				<tbody >					
					<tr ng-repeat="member in applications | MyOrderBy: f : rev1 | MyFilter: myfilter" 
						ng-class-odd="'odd'" ng-class-even="'even'" class="approver" id="tr{{member.dataId}}"  style="text-align: center;">
					<td style="text-align: left;" ><input type="checkbox" name="{{member.status}}" class="checkbox"  ng-model="member.selected" id="{{member.dataId}}," ng-click="checkBox(member.status,member.dataId)"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.empId"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)"><p style="width:70px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden; "title={{member.empName}} ng-bind="member.empName">
 			</p></td>
						<td style="font-size:13px;text-align: left;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)"><p style="width:180px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden; "title={{member.trainingProgram}} ng-bind="member.trainingProgram" >
 			</p></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.totalCost"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.companyCover"></td>
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.servicePeriodFrom "></td>						
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.servicePeriodTo"></td>						
						<td style="font-size:13px;" ng-dblclick="showdetail(member.dataId)" ng-click="focusme(member.dataId)" ng-bind="member.status"></td>
						
						<td style="word-break: keep-all;">
						<div ng-click="approveByApprover(member.dataId,member.status)" class="ref_{{ member.status }}"  title="Approve" style="background-repeat:no-repeat; background-position:-286px -0px; height: 16px; width: 16px;float: left;" ></div>
   						
   						<div  ng-click="showRejectNotes(member.dataId,member.status)" class="ref_{{ member.status }}"  title="Disapprove" style="background-repeat:no-repeat; background-position:-308px -0px; height: 16px; width: 16px;margin-left: 20px"></div>
   						
						</td>
						<td style="word-break: keep-all;">
<a  title="Agreement"style="cursor:pointer;background-image:url('img/glyphicons-halflings{{member.hasCertification}}.png');background-repeat:no-repeat; background-position:-23px -24px; height: 16px; width: 16px;float: left;" ng-click="checkAgreement(member.hasCertification,member.dataId)" ></a>						</td>
		
					</tr>
				</tbody>
			</table>
		</div>
		<!-- approver list end -->
		
		<!-- reject Notes start -->
			<div style="margin-left:30px;margin-right: 30px;display: none; border-style: solid;border-color: #A3B2C1; border-width:0px 1px" id="rejectNotes">
				<div class="row">
   						<div class="col-xs-2" style="text-align:right">Reject notes : </div>
   						<div class="col-xs-8"><textarea class="form-control input-sm"   ng-model="rejectNotes" style="resize:none;" maxlength="200"  rows="3" cols="20"></textarea>
   							<div style="line-height: 30px;"><span ng-bind="left2()"></span> characters remaining.
   							</div>
   						</div>
   						<div title="Submit" ng-click="disapproveByApprover(selapplication.dataId)" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-142px -73px; height: 18px; width: 18px;float:left; margin-top:40px"></div>
				
   					</div>
			</div>
			<!-- reject Notes end -->
			
			
			
			
<!-- approver list view start -->
		<div id="count1"
				style=" height: 20px; width: 150px;margin-top: 10px;">
			</div>
		<div style="margin-right:20px;display: none; border-style: solid;background-color: #f5f5f5; border-width:0px 0px;font-size:13px" id="approverdetail">
		<div style="margin-left:100px;margin-right: 60px;">
			<div class="row" style="margin-top:0px;margin-left: 20px;">
			<div class="row">
   						<div class="col-xs-11">Training&nbsp;program&nbsp;:&nbsp;&nbsp;<span style="width:300px; white-space:nowrap;text-overflow:ellipsis;
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
   						<div class="col-xs-6" >Approver&nbsp;:&nbsp;&nbsp;<span  ng-bind="selapplication.approver">&nbsp;&nbsp; </span> </div>
   						<div class="col-xs-6" >CC&nbsp;:&nbsp;&nbsp;<span style="width:230px; white-space:nowrap;text-overflow:ellipsis;
 			-o-text-overflow:ellipsis;overflow: hidden;" title={{selapplication.cc}} ng-bind="selapplication.cc" >
 			</span></div>
   						
   					</div>
  					<div class="row">
  						<div class="col-xs-6" >Total&nbsp;cost&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.totalCost" ></span><span>&nbsp;CNY</span></div>
   						   					
   						<div class="col-xs-6">Company cover&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.companyCover"  ></span><span>&nbsp;CNY</span></div>
   						
  					</div>
	  				<div class="row">
   						<div class="col-xs-6" >Training&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.trainingPeriodFrom" ></span><span>&nbsp;~&nbsp;</span> <span ng-bind="selapplication.trainingPeriodTo"></span></div>
   						<div class="col-xs-6" >Set&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.setPeriod" ></span></div>
   						
   					</div>  			
   					<div class="row">
   						<div class="col-xs-6" >Service&nbsp;period&nbsp;:&nbsp;&nbsp;<span ng-bind="selapplication.servicePeriodFrom" ></span><span>&nbsp;~&nbsp;</span><span ng-bind="selapplication.servicePeriodTo"></span></div>
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
   							<div style="background-image:url('img/more7.gif'); background-repeat:no-repeat;cursor:pointer;height:16px;margin-top:6px;width:6px;" class="col-xs-1 " onmouseover="history1('bb', 'show');" ></div>				
							<!-- show more reject notes -->
   						</div> 						
   				<div class="row label_{{selapplication.status}}"style="display:none;text-align:left;z-index:999;" id="bb" onmouseover="history('bb', 'show');" onmouseout="history('bb', 'hide');">
   						<div class="col-xs-1" style="margin-top:4px" >
   						
   						
   						</div>
   						<div class="col-xs-11" > 
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
					<div  class="col-xs-2" ng-click="showComments()"  title="Add Comments" style="background-image:url('img/glyphicons-halflings.png');cursor:pointer;background-repeat:no-repeat; background-position:-17px -47px; height: 16px; width: 16px;margin-left: -10px"></div>
   					<!-- comments start -->
			
				<div class="row" id="commentsDiv" style="display:none;z-index=999;margin-top: -25px;">

   						<div class="col-xs-2"style="margin-left:15px "></div>
   						<div class="col-xs-8"style="margin-left:-55px "><textarea class="form-control input-sm" placeholder="You can input some comments."  ng-model="comments" style="resize:none;" maxlength="200"  rows="3" cols="20"></textarea>

   							<div style="line-height: 30px;"><span ng-bind="left3()"></span> characters remaining.
   							</div>
   						</div>
   						<div title="Submit"  ng-click="commentsByApprover(selapplication.dataId)" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-142px -73px; height: 18px; width: 16px;float:left;margin-top:40px;z-index:999;"></div>
				
   					</div>
			
			<!-- comments end  -->
   					</div>	
   					<div class="row" style="margin-top: 5px;"></div>
   					</div>	
   					</div>  
   					</div>						
		</div>
   	<script type="text/javascript">
   	
	$('#id_th1').width($('#id_th1').width()-28);
	$('#ap_th1').width($('#ap_th1').width()-15);
	$('#tot_th1').width($('#tot_th1').width()-8);
	$('#com_th1').width($('#com_th1').width()-8);
	$('#sta_th1').width($('#sta_th1').width()-15);
	$('#end_th1').width($('#end_th1').width()-15);
	$('#stat_th1').width($('#stat_th1').width()-80);
	$('#pro_th1').width($('#pro_th1').width()+30);
	$('#icon_th1').width($('#pro_th1').width()-200);
	$('#icon_th2').width($('#icon_th1').width()-120);
   	for(var i=0;i<$('#theadapprover').children().children().size();i++){
   
		//alert($('#theadadmin').children().children().eq(i).width());
		$('#tbodyapprover').children().children().children().children().eq(i).width($('#theadapprover').children().children().eq(i).outerWidth());;
		//alert($('#thodyadmin').children().children().eq(i).width());
	}
</script>
   	
