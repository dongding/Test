<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


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
  				<li role="presentation" id="showemployee" class="" style="margin-left: 10px;"><a href="javascript:void(0);">As an Employee</a></li>
  				<li role="presentation" id="admineditpage" class="" style="display: none;margin-left: 10px;"><a href="javascript:void(0);">Edit</a></li>
  				<li role="presentation" id="empeditpage" class="" style="display: none;margin-left: 10px;"><a href="javascript:void(0);">Edit</a></li>
  				<li role="presentation" class="" id="agreetab" style="display: none;margin-left: 10px;"><a href="javascript:void(0);">View Agreement</a></li>
  				
			</ul>
		</div>
		</div>
		<div ng-app="MyApp" class="col-xs-12">
		<div id="shclKeyframes" style="width: 100px;height: 100px; z-index: 100; position: absolute;top: 250px;left:400px;"></div>
		
		<div class="alert alert-warning" role="alert" id="deleteWarn" style="padding-left: 100px; margin-bottom: 10px; display: none;">				
  				Do you want to delete this record ?  	
  				<input id="deldataid" type="hidden">			
				<span style="float: right;margin-right: 20px; cursor: pointer;" onclick="canceldel()">No</span>
				<span style="float: right;margin-right: 20px; cursor: pointer;" onclick="suredel()">Yes</span>
		</div>
		<div class="alert alert-warning" role="alert" id="deleteWarnadmin" style="padding-left: 100px; margin-bottom: 10px; display: none;">				
  				Do you want to delete this record ?  	
  				<input id="deldataid" type="hidden">			
				<span style="float: right;margin-right: 20px; cursor: pointer;" onclick="canceldeladmin()">No</span>
				<span style="float: right;margin-right: 20px; cursor: pointer;" onclick="suredeladmin()">Yes</span>
		</div>
<!-- content admin start-->
	<div ng-controller="father">
		<div  style="display: block;"  id="adminList" ng-controller="adminMain">
			<%@ include file="adminlist.jsp" %>
			<%@ include file="editTrainingByAdmin.jsp" %>
		</div>		
		
		<div style="display: block;"  id="" ng-controller="employeeMain">
				<%@ include file="employeelist.jsp" %>
				<%@ include file="editTrainingByEmployee.jsp" %>	
		</div>
		
		<div  style="display: block;" >
			
			<jsp:include page="agreementPageView2.jsp"></jsp:include>		
		</div>
		</div>
		</div>
	</div>
		
	<script>
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

</div>

