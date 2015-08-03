<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/jquery.shCircleLoader-min.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/father.js"></script>   
<script src="./js/addAsAdmin.js"></script>
<script src="./js/addAsEmployee.js"></script>
<script src="./js/bootstrap.min.js"></script>
<body style="container-fluid" onselectstart="return false;">
	<div class="row">
		<div class="col-xs-12" style="font-size:13px">
		    <ul class="breadcrumb"  style="padding-left: 30px;" id="breadcrumb">
    			<li><a href="#">Training&nbsp;Tracking</a></li>
    			<li><a href="#">Add</a></li>
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
  				<li role="presentation" class="" id="agreetab" style="display: none;margin-left: 10px;"><a href="javascript:void(0);">View Agreement</a></li>
  				<li role="presentation" id="editpage" class="" style="display: none;margin-left: 10px;"><a href="javascript:void(0);">Edit</a></li>
			</ul>
		</div>
		</div>
		<div ng-app="" class="col-xs-12">
		
	<div ng-controller="father">
		<div  style="display: block;"  id="adminList">
			<jsp:include page="addTrainingByAdmin.jsp"></jsp:include>
		</div>		
		
		<div  style="display: block;"  id="employeeList">
			<jsp:include page="addTrainingByEmployee.jsp"></jsp:include>
		</div>
		</div>
		</div>
	</div>
		
	<script>
	$('.agreementview').eq(1).css("display","none");
	for(var i=0;i<$('#selecttab').children('li').size();i++){
		$('#selecttab').children().eq(i).click(function (){
			
			var index = $(this).index();

			$('#selecttab').children().not(this).removeClass('active');
			$('#selecttab').children().eq(index).addClass('active');

			$('.agreementview').not($('.agreementview').eq(index)).css("display","none");
			$('.agreementview').eq(index).css("display","block");
			if(index==1){
				$('#employeeList').css("display","block");
			 	for(var i=0;i<$('#theademployee').children().children().size();i++){
					for(var j=0;j<$('#tbodyemployee').children().size();j++){
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
	</script>
</body>

