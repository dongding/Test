<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/print.css" rel="stylesheet" media="print" type="text/css"/>
<link href="css/screen.css" rel="stylesheet" media="screen" type="text/css"/>
<title>Training Tracking Home</title>



<%
	request.setAttribute("role","admin");
%>

<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/jquery.shCircleLoader-min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/ext-base.js"></script>
<script src="./js/ext-core.js"></script>
<script src="./js/adminMain.js"></script>  
<script src="./js/father.js"></script>   
<script src="./js/employeeMain.js"></script>
<script src="./js/method.js"></script>
<script type="text/javascript">
	function getCount() {
		var trs1 = $('.admin').size();
		var trs2 = $('.employee').size();
		$('#count1').html("Count :  " + (trs1) + " rows");
		$('#count2').html("Count :  " + (trs2) + " rows");
		setTimeout("getCount()", 100);
	}
	setTimeout("getCount()", 100);

</script>


<style>

.titlelist>li>a {
	color: gray;
}
a{
	font-size: 13px;
}
.table thead tr {
display:block;
}
.table tbody {
display: block;
overflow-y: auto;
overflow-x: hidden;
}

.submitted{
	display: none;
}
.approved{
	display: none;
}
.submitted,.title_submitted,.title_unsubmit,.resubmitted,.label_submitted,.comm_submitted,.comm_unsubmit{
	display: none;
}
.adm_approved,.adm_disapproved,.adm_resubmitted,.adm_submitted{
	background-image:url('img/glyphicons-halflings1.png');
	
}
.adm_unsubmit{
	background-image:url('img/glyphicons-halflings.png');
	cursor:pointer;
}
.emp_approved,.emp_submitted,.emp_resubmitted{
	background-image:url('img/glyphicons-halflings1.png');
	
}
.emp_unsubmit,.emp_disapproved{
	background-image:url('img/glyphicons-halflings.png');
	cursor:pointer;
}


</style>
</head>
<body>
	<div class="container" style="margin-top: 6px;" id="con">
		 <div class="row" id="head">
			<div class="span12">
				<img src="img/head.png" width="100%" height="100%" />
			</div>
		
			<div class="navbar navbar-inverse"  style="margin-top: 3px;">
				<nav class="navbar navbar-inverse" role="navigation">
					<div class="container-fluid">
					<!--         Brand and toggle get grouped for better mobile display -->
        				<div class="navbar-header">
<!--          					<a class="navbar-brand" href="#"><font style="font-size: 16px;">Training Tracking</font></a>-->
        				</div>

					<!--         Collect the nav links, forms, and other content for toggling -->
        				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
          					<ul class="nav navbar-nav">
           						<li class=""><a href="#">&nbsp;Home&nbsp;</a></li>
           							<li class="active"><a href="indexadmin.jsp">&nbsp;List&nbsp;</a></li>
           							<li class=""><a href="adminAction_preparetoaddapplication">&nbsp;Add&nbsp;</a></li>
           							<li><a href="Programadmin" class="bar"  id="bar">培训项目管理</a></li>
          					</ul>         					
          					<ul style="float:right;margin-top:13px">
          					<li><a href="login.jsp"><font color="#FFFFFF">Welcome,&nbsp;&nbsp;${user.empName}</font></a></li>         					
          					</ul>
        				</div>
        			</div>
				</nav>	
			</div>   	
		</div>
		<div class="row" style="margin-top:3px">
			<div class="col-xs-4 col-xs-offset-5">
				<div id="shclKeyframes" style="width: 100px;height: 100px; z-index: 100; position: absolute; top:250px;"></div>
			</div>
		</div>
	  	<div class="row" id="content" style="margin-top: -5px;" >
			<div style="container-fluid" onselectstart="return false;">
	<div class="row">
		<div class="col-xs-12">
		    <ul class="breadcrumb"  style="padding-left: 30px;" id="breadcrumb">
    			<li><a href="#">Training&nbsp;Tracking</a></li> 
    			<li><a href="#" class="bar"  id="bar">List</a></li>
    			
    		</ul>
		</div>
	</div>
	<div class="row bs-docs-example" id="examp">		
		<div class="col-xs-12" style="margin-bottom: 10px;">
			<!-- right navigation bars -->
		<div class="row">
			<ul class="nav nav-tabs" role="tablist" id="selecttab">
  				<li role="presentation" id="showadmin" class="active" style="margin-left: 10px;"><a href="javascript:void(0);">As an Admin</a></li>
  			
  				
			</ul>
		</div>
		</div>
		<div ng-app="MyApp" class="col-xs-12">
		<div id="shclKeyframes" style="width: 100px;height: 100px; z-index: 100; position: absolute;top: 250px;left:400px;"></div>
		
		

<!-- content admin start-->
	<div ng-controller="father">
		<div  style="display: block;"  id="adminList" ng-controller="adminMain">
			<table id="table1" width="100%" border="1" cellpadding="1"
							cellspacing="1" bgcolor="#a8c7ce">

							<tr>
								
								
								<td width="10%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">编号</span>
									</div>
								</td>
								<td width="20%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">项目培训名称</span>
									</div>
								</td>
								<td width="15%" height="20" bgcolor="d3eaef" class="STYLE6">
									<div align="center">
										<span class="STYLE10">操作</span>
									</div>
								</td>
							</tr>

		</div>		
	  	</div>
	  	
	  </div>
		
	  <script>
	  
	$('#con').height($(document).height()-5);
	$('#examp').height($('#con').height() - $('#head').height() - $('#breadcrumb').height()-70);
	if($('#examp').height()<550){
		$('#examp').height(550);
	}
	$('#tbodyadmin').height($("#examp").height() - $("#theadadmin").height() - $('#selecttab').height()-70);
   	$("#tbodyadmin").niceScroll({  
   		cursorcolor:"gray",  
   		cursoropacitymax:1,  
   		touchbehavior:false,  
   		cursorwidth:"7px",  
   		cursorborder:"0",  
   		cursorborderradius:"5px"  
   	}); 
   	$("#tbodyemployee").niceScroll({  
   		cursorcolor:"gray",  
   		cursoropacitymax:1,  
   		touchbehavior:false,  
   		cursorwidth:"7px",  
   		cursorborder:"0",  
   		cursorborderradius:"5px"  
   	});
   	

	for(var i=0;i<$('#selecttab').children('li').size();i++){
		$('#selecttab').children().eq(i).click(function (){
			
			var index = $(this).index();
			if(index==0||index==1){
				document.getElementById("bar").innerHTML="List";
				}
			
			if(index==2||index==3){
				document.getElementById("bar").innerHTML="Edit";
				
				}
			if(index==4){
				document.getElementById("bar").innerHTML="Agreement View";		
				}
			var tabindex = $(this).index();
			if(tabindex  == 1){
				index = 2;
			}else if(index == 2){
				index = 1;
			}
			$('#selecttab').children().not(this).removeClass('active');
			$('#selecttab').children().eq(tabindex).addClass('active');

			$('.agreementview').not($('.agreementview').eq(index)).css("display","none");
			$('.agreementview').eq(index).css("display","block");
			if(index==2){
				$('#employeeList').css("display","block");
			 	for(var i=0;i<$('#theademployee').children().children().size();i++){
					for(var j=0;j<$('#tbodyemployee').children().children().children().size();j++){
					if($('#tbodyemployee').children().children().children().eq(j).attr('id')=='employeedetail'){
						continue;
					}
						$('#tbodyemployee').children().children().children().eq(j).children().eq(i).width($('#theademployee').children().children('th').eq(i).outerWidth());;
					}
				}
			}
			
			$('#tbodyemployee').height($("#examp").height() - $("#theademployee").height() - $('#selecttab').height()-60);
			$("#tbodyemployee").niceScroll({  
		   		cursorcolor:"gray",  
		   		cursoropacitymax:1,  
		   		touchbehavior:false,  
		   		cursorwidth:"7px",  
		   		cursorborder:"0",  
		   		cursorborderradius:"5px"  
		   	}); 
			});			
	}
	function canceldel(){
		$('#deleteWarn').slideToggle();
	}
	function canceldeladmin(){
		$('#deleteWarnadmin').slideToggle();
	}
	function suredel(){
		var dataId = $('#deldataid').val(); 
		$.ajax({
	           type: "POST",
	           url: "deleteapplicationbydataid?dataId="+dataId,
	           success: function(){
			 $(document.getElementById(dataId)).remove();
			 $('#employeedetail').css("display","none");
			 $('#deleteWarn').slideToggle();			 
		 },
	           error:function(XMLHttpRequest, textStatus, errorThrown){
	        }
	       });
	}
	function suredeladmin(){
		var dataId = $('#deldataid').val(); 
		$.ajax({
	           type: "POST",
	           url: "deleteapplicationbydataid?dataId="+dataId,
	           success: function(){
			 $(document.getElementById(dataId+',')).remove();
			 $('#admindetail').css("display","none");
			 $('#deleteWarnadmin').slideToggle();			 
		 },
	           error:function(XMLHttpRequest, textStatus, errorThrown){
	        }
	       });
	}
	
	
</script>  
  </body>	
</html>
