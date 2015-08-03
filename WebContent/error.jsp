<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>error</title>
<%
	request.setAttribute("localhost",request.getLocalAddr());
	request.setAttribute("project",request.getContextPath());
%>
<script>

var t=5;
setInterval("refer()",1000);
function refer(){
if(t==0){
location="http://${localhost}:8080${project}/";
}
var show = document.getElementById('show');
show.innerHTML="after  "+t+"  seconds will jump to login page or you can click here"; // 显示倒计时
show.style.color="red";
t--;
}
</script>
</head> 
<body>
	<h1>There is no such Employee</h1><s:property value="#request.info"/></div>
	<span id="show"></span>
	<a href="http://${localhost}:8080${project}"><font size="20px" color="blue">login page</font></a>
</body>
</html>