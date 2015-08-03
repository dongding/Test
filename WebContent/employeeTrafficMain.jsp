<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setAttribute("role","employee");
%>
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/jquery.shCircleLoader-min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/ext-base.js"></script>
<script src="./js/ext-core.js"></script>
<script src="./js/adminMain.js"></script>   
<script src="./js/fatheremp.js"></script>  
<script src="./js/employeeMain.js"></script>
<script src="./js/method.js"></script>
<script src="./js/father.js"></script>
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
.emp_disapproved,.emp_unsubmit{
	background-image:url('img/glyphicons-halflings.png');
	cursor:pointer;
}

</style>


<div style="container-fluid" onselectstart="return false;">
	<div class="row">
		<div class="col-xs-12">
		    <ul class="breadcrumb"  style="padding-left: 30px;" id="breadcrumb">
    			<li><a href="#">Training&nbsp;Tracking</a></li>
    			<li   ><a href="#" class="bar" id="bar2">ListTraining</a></li>
    			<li   ><a href="showalltraffic" class="bar" id="bar2">ListTraffic</a></li>
    		</ul>
		</div>
	</div>
	<div class="row bs-docs-example" id="examp">		
		<div class="col-xs-12" style="margin-bottom: 10px;">
			<!-- right navigation bars -->
		<div class="row">
			<ul class="nav nav-tabs" role="tablist" id="selecttab">
  				<li role="presentation" id="showemployee" class="active" style="margin-left: 10px;"><a href="javascript:void(0);">&nbsp;&nbsp;&nbsp;List&nbsp;&nbsp;&nbsp;</a></li>
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
				<span style="float: right;margin-right: 30px; cursor: pointer;" onclick="canceldel()">No</span>
				<span style="float: right;margin-right: 30px; cursor: pointer;" onclick="suredel()">Yes</span>
		</div>
		
<!-- content admin start-->
		<div ng-controller="fatheremp">
			<div style="display: block;"  id="" ng-controller="employeeMain">
				<%@ include file="employeetrafficlist.jsp" %>
				<%@ include file="editTrainingByEmployee.jsp" %>	
			</div>
			<div  style="display: block;" >
				<%@ include file="agreementPageView2.jsp" %>		
			</div>
		</div>
		</div>
	</div>
		
	<script src="./js/method.js"></script>
	<script>
		
	for(var i=0;i<$('#selecttab').children('li').size();i++){
		$('#selecttab').children().eq(i).click(function (){
			
			var index = $(this).index();
			if(index==0){
				document.getElementById("bar2").innerHTML="List";
				}
			if(index==1){
				document.getElementById("bar2").innerHTML="Edit";
				}
			if(index==2){
				document.getElementById("bar2").innerHTML="Agreement View";
				}
			$('#selecttab').children().not(this).removeClass('active');
			$('#selecttab').children().eq(index).addClass('active');

			$('.agreementview').not($('.agreementview').eq(index)).css("display","none");
			$('.agreementview').eq(index).css("display","block");
		});			
	}
	function canceldel(){
		
		$('#deleteWarn').slideToggle();
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
	</script>
</div>
