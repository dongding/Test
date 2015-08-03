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
           							<li><a href="Programadmin.jsp" class="bar"  id="bar">培训项目管理</a></li>
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
			<%@include file="adminMain.jsp" %>
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
</script>  
</body>
</html>
