function addAsEmployee($scope,$http) {
	$scope.period = {time:"",value:null};
	$scope.periodtype = [{time:"12 months",value:12},{time:"6 months",value:6}];
	$scope.status = "";
	$scope.statustype = [{sta:"approved"},{sta:"submitted"}];
    $scope.reason = "";
    $scope.time1="";
    $scope.time2="";
    $scope.time3="";
    $scope.time4="";
    $scope.money1 ="";
    $scope.money2 ="";
    $scope.cc = "";
	$scope.approver = "";
	$scope.program = "";
	$scope.showmsg1 = "";
	$scope.showmsg2 = "";
	$scope.showmsg3 = "";
	$scope.msg1 = "";
	$scope.msg2 = "";
	$scope.msg3 = "";
	$scope.type = "";
	$http.post("getApplicationById?tempId="+$('#tempId').val())
	    .success(function(data) {
	    var val = data.split(",");
		$scope.approver = val[3].split("=")[1];
		$scope.cc = val[4].split("=")[1];
		$scope.program = val[5].split("=")[1];
		$scope.money1 = val[6].split("=")[1];
		$scope.money2 = val[7].split("=")[1];
		$scope.time1 = val[8].split("=")[1];
		$scope.time2 = val[9].split("=")[1];
		$scope.time3 = val[10].split("=")[1];
		$scope.time4 = val[11].split("=")[1];
		$scope.period.time = val[10].split("=")[1];
		if($scope.period.time=="12 months"){
			$scope.period.value=12;
		}else if($scope.period.time=="6 months"){
			$scope.period.value=6;
		}
		$scope.time3 = val[11].split("=")[1];
		$scope.time4 = val[12].split("=")[1];
		$scope.reason = val[13].split("=")[1];
	    	}
	    ).error(function(){
	    });
	 
	 
	    $scope.view = function(v){
        window.location.href="showdetail?id="+v;	    
	    };
	$scope.setCc = function(va){
		if(isExit(va))
			return;
		else
			$scope.cc = $scope.cc+va+";";
	    };
	$scope.setApprover = function(va){
	    	$scope.approver = va;
	    };
	    
	$scope.setProgram = function(va){
	    	$scope.program = va;
	    };
	    
	    $scope.checkMoney = function() {
			//alert("++++++++++");
			var m2 = $scope.money2;
	    	var m1 = $scope.money1;
	    	m2 = m2.replace(/[,]/g,""); 
	    	m1 = m1.replace(/[,]/g,""); 
	    	if(parseFloat(m2)>=100000){
	    		$scope.msg1 = "Company cover should be smaller than 100,000.00.";
				$scope.showmsg1 = "block";
				$('#money2').css("border-color","red");
				return $scope.msg1;
	    	}else{
	    		if(parseFloat(m2) > parseFloat(m1)) {
	    		$scope.msg1 = "Company cover should be smaller than Total cost.";
				$scope.showmsg1 = "block";
				$('#money1').css("border-color","red");
				$('#money2').css("border-color","red");
				return $scope.msg1;
	    		}else{
	    		$scope.msg1 = "";
	    		$scope.showmsg1 = "none";
	    		if($scope.msg3 == "") {
	    			$('#money1').css("border-color","");
	    			$('#money2').css("border-color","");
	    		}
				return $scope.msg1;
	    	}
	    	}
	    };
	    $scope.checkTime = function() {
			var dtArr1 = $scope.time1.split("-");
			var dtArr2 = $scope.time2.split("-");
			var dt1 = new Date(dtArr1[0], dtArr1[1], dtArr1[2]);
			var dt2 = new Date(dtArr2[0], dtArr2[1], dtArr2[2]);
			if(dt1>dt2) {
				$scope.msg2 = "End training period should be later than begin training period.";
				$scope.showmsg2 = "block";
				$('#datetimepicker1').css("border-color","red");
				$('#datetimepicker2').css("border-color","red");
				return $scope.msg2;
			}else {
				$scope.msg2 = "";
				$scope.showmsg2 = "none";
				if($scope.msg3 == "") {
					$('#datetimepicker1').css("border-color","");
					$('#datetimepicker2').css("border-color","");
				}
				return $scope.msg2;
			}
	   };
    $scope.checkAll = function() {
    	
    	var program = $scope.program;
    	//alert(program);
    	if(program == "") {
    		$('#trainingProgram').css("border-color","red");
    	}
    	else {
    		$('#trainingProgram').css("border-color","");
    	}
    	var time1 = $scope.time1;
    	if(time1 == "") {
    		$('#datetimepicker3').css("border-color","red");
    	}
    	else {
    		$('#datetimepicker3').css("border-color","");
    	}
    	var time2 = $scope.time2;
    	if(time2 == "") {
    		$('#datetimepicker4').css("border-color","red");
    	}
    	else {
    		$('#datetimepicker4').css("border-color","");
    	}
    	var money1 = $scope.money1;
    	if(money1 == "") { 
    		$('#totalCost').css("border-color","red");
    	}
    	else {
    		$('#totalCost').css("border-color","");
    	}
    	var money2 = $scope.money2;
    	if(money2 == "") {
    		$('#companyCover').css("border-color","red");
    	}
    	else {
    		$('#companyCover').css("border-color","");
    	}
    	var period = $scope.period.time;
    	if(period == "") {
    		$('#setPeriod').css("border-color","red");
    	}
    	else {
    		$('#setPeriod').css("border-color","");
    	}
    	if(program == "" || time1 == "" || time2 == "" || money1 == "" || money2=="" || period=="" ){
    		$scope.msg3 = "The fields with ' * ' cannot be blank.";
			$scope.showmsg3 = "block";
			return $scope.msg3;
    	}else{
    		$scope.msg3 = "";
    		$scope.showmsg3 = "none";
    		return $scope.msg3;
    	}
    };
    $scope.checkState = function() {
    	if($scope.msg3 != ""){
    		$scope.checkAll();
    	}
    	$scope.checkMoney();
    	$scope.checkTime();
    	var s1=$scope.showmsg1;
    	var s2=$scope.showmsg2;
    	var s3=$scope.showmsg3;
    	if(s1 == "block" || s2 == "block" || s3 == "block")
    		return "block";
    	else
    		return "none";
    };
    $scope.submitAsEmployee = function(){
    	
    	$scope.checkAll();
    	var s1=$scope.showmsg1;
    	var s2=$scope.showmsg2;
    	var s3=$scope.showmsg3;
	    	// alert(s1 + s2 + s3);
    	if(s1 != "block" && s2 != "block" && s3 != "block") {
    		$('#saveEmp').attr("action","addapplicationbyemployee");
    		$('#saveEmp').submit();
    	}
    };
    $scope.setPeriod = function(va,ve){
    	$scope.period.time = va;
    	$scope.period.value = ve;
    };
    $scope.setStatus = function(ve){
    	$scope.status = ve;
    };
    $scope.left  = function() {
    	return 500 - $scope.reason.length;
    };
    $scope.getthedate = function (){
    	// error check
		if($scope.time2!=""){
			
    	var a = new Date($scope.time2);
    	a = a.valueOf();
    	a = a + 1 * 24 * 60 * 60 * 1000;
    	a = new Date(a);
    	var m = a.getMonth() + 1;
    	if(m.toString().length == 1){
    	    m='0'+m;
    	}
    	var d = a.getDate();
    	if(d.toString().length == 1){
    	    d='0'+d;
    	}
    	$scope.time3 = a.getFullYear() + "-" + m + "-" + d;
		return $scope.time3;
			}
    };
    
    $scope.gettheMonth = function (){
		if($scope.time3!='' && ($scope.period.value==12||$scope.period.value==6)){
		
    	var ti = $scope.time2.split("-");
    	var year = parseInt(ti[0]);
    	var month =   parseInt(ti[1]);
    	var day =   parseInt(ti[2]);
    	if(parseInt($scope.period.value)==12){
    		year = year+1;
    	}
    	if(parseInt($scope.period.value)==6){
    		if(month>6){
    			year = year + 1;
    			month = month + 6 - 12;
    		}else{
    			month = month + 6;
    		}
    	}
    	if(month==2&&day==29){
    		day--;
    	}
    	if(month<10){
    		month = "0" + month;
    	}
    	if(day<10){
    		day= "0" + day;
    	}
		$scope.time4 = year + "-" + month + "-" + day;
    	return $scope.time4;
		}
    };
   
    $scope.saveAsEmployee = function(){
    	alert("enter approver save");
    	$('#saveEmp').attr("action","saveapplicationbyemployee");
    	$('#saveEmp').submit();
    };
    //add by hacher.yu
    $http.post("getallprogrambyJson")
    .success(function(data) {
    	$scope.all = data;
    }
    ).error(function(){
    });
}