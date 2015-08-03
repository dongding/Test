<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/bootstrap1.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
<script src="./js/jquery.js"></script>
<script src="./js/angular.js"></script>
<script src="./js/jquery.shCircleLoader-min.js"></script>
<script src="./js/fatheremp.js"></script>   
<script src="./js/addAsEmployee.js"></script>
<script src="./js/jquery.datetimepicker.js"></script>
<script src="./js/bootstrap.js"></script>
<title>Training Application Add</title>

</head>
<body >
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
           							<li class=""><a href="indexapprover.jsp">&nbsp;List&nbsp;</a></li>
           							<li class="active"><a href="preparetoaddapplication">&nbsp;Add&nbsp;</a></li>
          					</ul>         					
          					<ul style="float:right;margin-top:13px">
          					<li><a href="login.jsp"><font color="#FFFFFF">Welcome,&nbsp;&nbsp;${user.empName}</font></a></li>         					
          					</ul>
        				</div>
        			</div>
				</nav>	
			</div>   	
		</div>
		<div class="row">
		<ul class="breadcrumb"  style="padding-left: 30px;font-size:13px">
    		<li><a href="#">Training&nbsp;Tracking</a></li>
   			<li><a href="#">Add</a></li>
  		</ul>

	   	<div class="row bs-docs-example" id="examp">		
		<div ng-app="" class="col-xs-12">
		
	<div ng-controller="fatheremp">		
		<div  style="display: block;"  id="employeeList" style="margin-top: -1px;">
			<jsp:include page="addTrainingByEmployee.jsp"></jsp:include>
		</div>
	</div>
	</div>
	</div>
	  	
	  </div>	
	  </div>
</body>
</html>
