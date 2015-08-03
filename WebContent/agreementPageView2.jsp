<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/print.css" rel="stylesheet" media="print" type="text/css"/>
<link href="css/screen.css" rel="stylesheet" media="screen" type="text/css"/>
<title>Agreement View</title>
<script type="text/javascript">
	function getTime(){
		var d = new Date();
		$('.dateTime').each(function(){
				$(this).html(d.getFullYear()+"-"+d.getMonth()+1+"-"+d.getDate());
			});
		setTimeout("getTime()",100);
		}
	setTimeout("getTime()",100);
</script>
</head>
<body>
<!--startprint-->
	<!-- this form is for all user to view the agreement from the application page -->
	<form class="agreementview form-horizontal" method="post" id="agreementview" name="form"  action="" style="display: none;" >
			<div id="info">
					<table style="font-size:12px;width:1100px;">												
						<tr>
							<td style="font-size:13px;"><b>Notice:</b></td>
							<td>&nbsp;&nbsp;1.</td>
							<td>&nbsp;You need to print it and sign your name for two copies, and then deliver them to the training coordinator.</td>							
						</tr>
						<tr>
							<td></td>
							<td>&nbsp;&nbsp;2.</td>
							<td>&nbsp;Please use black pen to sign your name at the end of the contract.
							<input type="hidden" value="{{status}}" id="status2">
							<div title="Print" onclick="preview()" style="cursor:pointer;background-image:url('img/glyphicons-halflings.png');background-repeat:no-repeat; background-position:-97px -44px; height: 20px; width: 20px; float:right;margin-right:10px">
							</div>
							</td>
						</tr>
					</table>
					</div>
					
				<div class="panel panel-default" style="overflow-y: auto;" id="agreeinfo">	
					<div>&nbsp;</div>
					<!--startprint1-->
					<div class=""><center><img src="img/agree.png" width="200" height="110"></center></div>
					<div>&nbsp;</div>
					<div class="">
					<div > 						
  						<center><h3><b class="title chinese">培 训 协 议</b></h3></center>
		 			</div >
		 			<div > 						
  						<center><h3><b class="title english">TRAINING AGREEMENT</b></h3></center>
		 			</div>
		 			</div>
		 			<div class="print" >
		 			<div class="body" style="margin-left:120px;">
  					<div class="row" >
   						<div class="col-xs-2 english">Party A&nbsp;:</div>
   						<div class="col-xs-4 english">
   							APTECH
						</div>
   					</div>
   					<div class="row ">
   						<div class="col-xs-2 english">Address&nbsp;:</div>
   						<div class="col-xs-8 english">
   							China Beijing
						</div>
   					</div>
   					<div class="row">
   						<div class="col-xs-2">甲方：</div>
   						<div class="col-xs-4">
   							北大青鸟
						</div>
   					</div>
   					<div class="row">
   						<div class="col-xs-2">注册地：</div>
   						<div class="col-xs-8">
   							中国北京

						</div>
   					</div>
   					<div class="row">
   						<div class="col-xs-2">邮编：</div>
   						<div class="col-xs-3">
   							310053
						</div>
   					</div>
   					<div>&nbsp;</div>
   				 <div>&nbsp;</div>
   					<div class="row">
   						<div class="col-xs-10 marginCn" >依据中华人民共和国（“中国”）的相关法律和规定，并依照公平公正的原则，
   						北大青鸟（甲方）和 <input disabled="disabled" type="text" name="" size="6" class="input" value='{{empName}}'>（乙方）
						就培训项目达成以下协议：
   						</div>   					
   					</div>
					<div>&nbsp;</div>
					</div>
					
					<div class="body" style="margin-left:120px;">
						<table class="print_table">
							<tr >
								<td class="td">1.</td>
								<td>
									<div >甲方基于工作需要，从
				   						<input disabled="disabled" type="text" name="trainingPeriodFromCn" size="12" value='{{trainingPeriodFrom}}'  class="input"> 起至
				   						<input disabled="disabled" type="text" name="trainingPeriodToCn" size="12" value='{{trainingPeriodTo}}'  class="input"> 将送乙方参加由
				   						培训项目
				   						<span class="program">{{trainingProgram}}</span>
				   						（在接下来的合同中将用“培训”来指代）。
				   					</div> 
								</td>
							
							</tr>
			
						</table>
						
						<center class="printf1"><img src="img/foot.png" alt="" width="860" height="70" ></center>
						<div class="PageNext"><center ><img src="img/agree.png" width="200" height="110"></center></div> 
						<div class="temp">&nbsp;</div>
						<table class="col-xs-12 print_table">
				
					
							<tr>
								<td class="td">2.</td>
								<td>
								 
				   					<div >培训费用指因为参加培训而需支付和发生的费用，包括由甲方支付的学费、考试费,以及直接相关住宿和交通等费用(若培训地点在杭州，则培训交通费用由员工自行承担)。
				   					</div> 
								</td>
							</tr>
						
						<tr><td colspan="2"><div>&nbsp;</div></td></tr>
						
					
						<tr>
							<td class="td">3.</td>
							<td>
								<div  >培训费用支付情况:</div>
							</td>
						</tr>
						<tr>
							<td class="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<div class="col-xs-10">
									<table>
										<tr>
											<td style="text-align: left;vertical-align: super;text-indent: 1em">a.&nbsp;</td>
											<td>应根据乙方完成的培训课程及相应的成绩和评估情况而定,如乙方完成培训课程包括通过相关考试或评估,则由甲方支付培训费用;</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						
						<tr>
							<td class="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<div class="col-xs-10">
										<table>
											<tr>
												<td style="text-align: left;vertical-align: super;text-indent: 1em">b.&nbsp;</td>
												<td>如乙方未完成培训课程或未通过相关考试或评估,则由乙方承担全部培训费用。</td>
											</tr>
										</table>
								</div>
							</td>
						</tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr>
							<td class="td">4.</td>
							<td>
								<div  >培训费用总计:</div>
							</td>
						</tr>
				       <tr>
							<td class="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<div class="col-xs-10">
									<table>
										<tr>
											<td style="text-align: left;vertical-align: super;text-indent: 1em">a.&nbsp;</td>
											<td>培训费用 <span class="program"><input disabled="disabled" type="text" name="" size="8" value='{{totalCost}}'  class="input"></span></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr>
							<td class="td">&nbsp;&nbsp;&nbsp;&nbsp;</td>
							<td>
								<div class="col-xs-10">
									<table>
										<tr>
											<td style="text-align: left;vertical-align: super;text-indent: 1em">a.&nbsp;</td>
											<td>甲方承担的培训费用：
		   										<span class="program">{{companyCover}}</span></td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
									
									<tr><td colspan="2">&nbsp;</td></tr>
							<tr >
								<td class="td">5.</td>
								<td>
									<div  >甲方有权取消乙方的培训安排，同时免除对乙方所负的责任。如果乙方违反了甲方的公司纪律、制度、规定或是培训地国家的法律和相关规定，而导致甲方中断和取消培训安排，乙方同意偿还甲方在第5条列出的甲方承担的培训费用。
				   					</div> 
								</td>
							</tr>
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr >
								<td class="td">6.</td>
								<td>
									
				   					<div >乙方同意在以下情况下向甲方偿还培训费用：
				   					</div> 
				   					<div class="col-xs-10">
					   					<table >
											<tr class="marginCn1">
												<td  class="td_first">a.</td>
												<td>乙方在培训期间终止了与甲方签订的就业合同,乙方必须向甲方偿还全部的培训费用。</td>
											</tr>
											<tr class="marginCn1">
												<td  class="td_first">b.</td>
												<td>乙方在培训结束后未能完成规定服务期限内终止了与甲方签订的就业合同, 乙方按照未服务时间占本协议所规定的服务期限的比例偿还部分的培训费用（见第8条）。</td>
											</tr>
										</table>
				   					</div>
								</td>
							</tr>
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr>
								<td class="td">7.</td>
							
						
							<td>
							<div  >
							乙方同意在培训结束后为甲方工作十二（12）个月；如果乙方未能完成上述服务期限，应按比例赔付甲方的培训费用。赔付比例是未服务时间占本协议所规定的服务期限的比例。(计算公式：甲方支付总额/一年服务期内工作日数*剩余工作日数)。</div></td></tr>
							<tr><td colspan="2">&nbsp;</td></tr>
							<tr >
							<td class="td">8.</td>
							<td>
								
								<div  >如果乙方违反本协议且不偿还培训费用，甲方有权采取法律行为（如请求仲裁，诉讼，扣留乙方工资/奖金）以减低损失。 
			   					</div>
			   					
								 
							</td>
						</tr>
							<tr><td colspan="2" >&nbsp;</td></tr>
							<tr >
							<td class="td">9.</td>
							<td>
								
								<div  >没有在本协议中提到的事项受中华人民共和国、浙江省、杭州市的相关法律和甲方员工手册规范。如本协议中有任何规定与法律和规定冲突，服从法律规定。
			   					</div> 
							</td>
						</tr>
						<tr><td colspan="2" >&nbsp;</td></tr>
						<tr >
							<td class="td">10.</td>
							<td>
								
								<div >如本协议中的有些条款被有管辖权的劳动仲裁委员会或法院判定无效，并不影响本协议其他条款的有效性或可实施性。 
			   					</div> 
			   					<div>&nbsp;</div>
							</td>
						</tr>
						
						<tr >
							<td class="td">11.</td>
							<td>
								
								<div  >如果本协议的有些条款与其他任何与培训有关的协议的任何条款有直接冲突，以本协议条款为准。
			   					</div> 
							</td>
						</tr>
						<tr><td colspan="2">&nbsp;</td></tr>
						<tr >
							<td class="td">12.</td>
							<td>
								
								<div  >本协议原件签署两份，甲方和乙方各执一份。
			   					</div> 
							</td>
						</tr>
						<tr><td colspan="2" >&nbsp;</td></tr>
						
					</table>	
					<center class="printf4"><img src="img/foot.png" alt="" width="860" height="70" ></center>
						<div class="PageNext"><center ><img src="img/agree.png" width="200" height="110"></center></div>
						<div class="temp">&nbsp;</div>
					<div class="row" style="margin-top: 20mm;">
   						<div class="col-xs-12"><div class="col-xs-6">甲方：北大青鸟</div>
   						<div class="col-xs-6">乙方：{{empName}}</div>
   						</div>   					
   					</div> 
   			  					
   					<div class="row">
   						<div class="col-xs-12">
   						<div class="col-xs-6">日期：{{updateDate}}</div> 
						<div class="col-xs-6" style=""> 日期 : <span class="dateTime"  style="font-weight: normal;"></span></div>
   						</div>   					
   					</div> 
   					

					<center class="printff" ><img src="img/foot.png" alt="" width="900" height="70" align="middle"></center>
   					</div>
   					</div>
   					</div>
   					<!--endprint1-->
   					<div class="row" style="margin-top: -1%;">
   						<div class="btn-group col-xs-8">
   						</div>
   						
   						<div class="btn-group col-xs-1" style="float:right;margin-right:20px">
   							<button type="button" class="btn btn-default btn-xs" onclick="cancel()" >&nbsp;cancel&nbsp;</button>
   						</div>
   						</div>
   					
   							
		 		</form>	
<!--endprint-->
</body>
<script language="javascript">
function preview()  
{  
   bdhtml=window.document.body.innerHTML;  
   
    sprnstr='<!--startprint1-->';
	
	eprnstr='<!--endprint1-->';
	
    prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17);  
    prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr));  
    window.document.body.innerHTML=prnhtml;
    window.print(); 
    window.document.body.innerHTML=bdhtml; 
    
} 


function cancel(){
	$(".bar").text("Application List");
	var index = 2;
	$('#agreetab').css("display","none");
	$('#selecttab').children().not(this).removeClass('active');
	$('#selecttab').children().eq(0).addClass('active');
	
	
	$('.agreementview').css("display","none");
	$('.agreementview').eq(0).css("display","block");
}
</script> 
</html>
