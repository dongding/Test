<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
	request.setAttribute("role", "approver");
%>

<link href="css/jquery.datetimepicker.css" rel="stylesheet"	type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/jquery.shCircleLoader-min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/ext-base.js"></script>
<script src="./js/ext-core.js"></script>
<script src="./js/method.js"></script>
<script src="./js/father.js"></script>
<script src="./js/approverMain.js"></script>
<script src="./js/employeeMain.js"></script>
<script type="text/javascript">
	function getCount() {
		var trs1 = $('.approver').size();
		var trs2 = $('.employee').size();
		$('#count1').html("Count :  " + (trs1) + " rows");
		$('#count2').html("Count :  " + (trs2) + " rows");
		setTimeout("getCount()", 100);
	}
	setTimeout("getCount()", 100);

	function SelectAll() {
		var checkboxs = document.getElementsByName("choose");
		//alert("fsda");
		for ( var i = 0; i < checkboxs.length; i++) {
			var e = checkboxs[i];
			e.checked = !e.checked;
		}
	}
	
</script>

<style>
.titlelist>li>a {
	color: gray;
}

a {
	font-size: 13px;
}

.table thead tr {
	display: block;
}

.table tbody {
	display: block;
	overflow-y: auto;
	overflow-x: hidden;
}

.submitted,.approved,.title_submitted,.title_unsubmit,.label_submitted,.comm_submitted,.comm_unsubmit {
	display: none;
}

.ref_approved,.ref_disapproved {
	background-image: url('img/glyphicons-halflings1.png');
}

.ref_submitted,.ref_resubmitted {
	background-image: url('img/glyphicons-halflings.png');
	cursor: pointer;
}

.emp_approved,.emp_submitted,.emp_resubmitted {
	background-image: url('img/glyphicons-halflings1.png');
}

.emp_disapproved,.emp_unsubmit {
	background-image: url('img/glyphicons-halflings.png');
	cursor: pointer;
}

.adm_approved,.adm_disapproved,.adm_resubmitted,.adm_submitted{
	background-image:url('img/glyphicons-halflings1.png');
	
}
.adm_unsubmit{
	background-image:url('img/glyphicons-halflings.png');
	cursor:pointer;
}
</style>


<div style="" onselectstart="return false;" ng-app="MyApp">
<div class="row">
<div class="col-xs-12">
<ul class="breadcrumb" style="padding-left: 30px;" id="breadcrumb">
	<li><a href="#">Training&nbsp;Tracking</a></li>	
	<li><a href="#"  id="bar3" class="bar">List</a></li>
</ul>
</div>
</div>
<div class="row bs-docs-example" id="examp">
<div class="col-xs-12" style="margin-bottom: 10px;"><!-- right navigation bars -->
<div class="row">
<ul class="nav nav-tabs" role="tablist" id="selecttab">
	<li role="presentation" id="showapprover" class="active"
		style="margin-left: 10px;"><a href="javascript:void(0);">As
	an Approver</a></li>
	<li role="presentation" id="showemployee" class=""
		style="margin-left: 10px;"><a href="javascript:void(0);">As
	an Employee</a></li>
	<li role="presentation" class="" id="agreetab"
		style="display: none; margin-left: 10px;"><a
		href="javascript:void(0);">View Agreement</a></li>
	<li role="presentation" id="empeditpage" class=""
		style="display: none; margin-left: 10px;"><a
		href="javascript:void(0);">Edit</a></li>

</ul>
</div>
</div>
<div ng-app="MyApp" class="col-xs-12">
	<div id="shclKeyframes"		style="width: 100px; height: 100px; z-index: 100; position: absolute; top: 250px; left: 400px;"></div>

   <div class="alert alert-warning" role="alert" id="deleteWarn"
	style="padding-left: 100px; margin-bottom: 10px; display: none;">
Are you sure to delete this record ? <input id="deldataid" type="hidden">
<span style="float: right; margin-right: 20px;" onclick="canceldel()">No</span>
<span style="float: right; margin-right: 20px;" onclick="suredel()">Yes</span>
</div>

<!-- content approver start-->
<div ng-controller="father">
<div style="display: block;" id="approverList"
	ng-controller="approverMain"><jsp:include page="approverlist.jsp"></jsp:include>
</div>

<div style="display: block;" id="" ng-controller="employeeMain"><%@ include
	file="employeelist.jsp"%> <%@ include
	file="editTrainingByEmployee.jsp"%></div>

<div style="display: block;" id="view2"><jsp:include
	page="agreementPageView2.jsp"></jsp:include></div>
</div>
</div>
</div>

<script>
	for(var i=0;i<$('#selecttab').children('li').size();i++){
		$('#selecttab').children().eq(i).click(function (){
			
			var index = $(this).index();
			if(index==0||index==1){
				document.getElementById("bar3").innerHTML="List";
				}
			
			if(index==3){
				document.getElementById("bar3").innerHTML="Edit";
				
				}
			if(index==2){
				document.getElementById("bar3").innerHTML="Agreement View";		
				}
			$('#selecttab').children().not(this).removeClass('active');
			$('#selecttab').children().eq(index).addClass('active');
			if(index==2){
				index = 3;
			}else if(index == 3){
				index =2;
			}
			$('.agreementview').not($('.agreementview').eq(index)).css("display","none");
			$('.agreementview').eq(index).css("display","block");
			
			if(index==1){
			 	for(var i=0;i<$('#theademployee').children().children().size();i++){
					for(var j=0;j<$('#tbodyemployee').children().children().children().size();j++){
						if($('#tbodyemployee').children().children().children().eq(j).attr('id')=='employeedetail'){
							continue;
						}
					$('#tbodyemployee').children().children().children().eq(j).children().eq(i).width($('#theademployee').children().children('th').eq(i).outerWidth());;
					}
				}

				$('#tbodyemployee').height($("#examp").height() - $("#theademployee").height() - $('#selecttab').height()-60);	
			}
		});			
	}

	function canceldel(){
		$('#deleteWarn').slideToggle("slow");
	}
	function suredel(){
		var dataId = $('#deldataid').val(); 
		$.ajax({
	           type: "POST",
	           url: "deleteapplicationbydataid?dataId="+dataId,
	           success: function(){
			 $(document.getElementById(dataId)).remove();
			 $('#employeedetail').css("display","none");
			 $('#deleteWarn').slideToggle("slow");			 
		 },
	           error:function(XMLHttpRequest, textStatus, errorThrown){
	        }
	       });
	}
	</script>

</div>

