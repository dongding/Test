<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/fatheremp.js"></script>   
<script src="./js/addAsEmployee.js"></script>
<body style="container-fluid" onselectstart="return false;">
	<div class="row">
		<div class="col-xs-12" style="font-size:13px">
		    <ul class="breadcrumb"  style="padding-left: 30px;" id="breadcrumb">
    			<li><a href="#">Training&nbsp;Tracking</a></li>
    			<li><a href="#">AddTraining</a></li>
    			<li><a href="preparetoaddapplication1">AddTraffic</a></li>
    		</ul>
		</div>
	</div>
	<div class="row bs-docs-example" id="examp">		
		<div ng-app="" class="col-xs-12">
		
	<div ng-controller="fatheremp">		
		<div  style="display: block;"  id="employeeList">
			<jsp:include page="addTrainingByEmployee.jsp"></jsp:include>
		</div>
	</div>
	</div>
	</div>
</body>

