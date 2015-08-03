function addAsEmployee($scope,$http){
	$scope.chineseName="";
	$scope.identification="";
	$scope.approver="";
	$scope.cc="";
	$scope.trainingInstitution="";
	$scope.program="";
	$scope.money1="";
	$scope.money2="";
	$scope.time1="";
	$scope.time2="";
	$scope.time3="";
	$scope.time4="";
	$scope.period={time:"",value:null};
	$scope.periodtype=[{time:"12 months",value:12},{time:"6 months",value:6}];
	$scope.reason="";
	
	//check
	$scope.isEmpty=false;
	$scope.checkMoney=function(){
		alert("enter check");
		var m2 = $scope.money2;
    	var m1 = $scope.money1;
    	m2 = m2.replace(/[,]/g,""); 
    	m1 = m1.replace(/[,]/g,""); 
    	if(parseFloat(m2)>=100000){
			$('#companyCover').css("border-color","red");
			return "Company cover should be smaller than 100,000.00."
    	}
    	else{
    		if(parseFloat(m2) > parseFloat(m1)){
    			$('#totalCost').css("border-color","red");
    			$('#companyCover').css("border-color","red");
    			return "Company cover should be smaller than Total cost.";
    		}
    		else{
    			$('#totalCost').css("border-color","");
    			$('#companyCover').css("border-color","");
    			return "";
    		}
    	}
    };
    $scope.checkTime = function(){
		var dtArr1 = $scope.time1.split("-");
		var dtArr2 = $scope.time2.split("-");
		var dt1 = new Date(dtArr1[0], dtArr1[1], dtArr1[2]);
		var dt2 = new Date(dtArr2[0], dtArr2[1], dtArr2[2]);
		if(dt1>dt2){
			$('#datetimepicker3').css("border-color","red");
			$('#datetimepicker4').css("border-color","red");
			return "End training period should be later than begin training period."
		}
		else{
			$('#datetimepicker3').css("border-color","");
			$('#datetimepicker4').css("border-color","");
			return "";
		}
    };
    $scope.checkAll=function(){
    	$scope.isEmpty=false;
    	if($scope.program==""){
    		$scope.isEmpty=true;
    		$('#trainingProgram').css("border-color","red");
    	}
    	else
    		$('#trainingProgram').css("border-color","");
    	if($scope.money1==""){
    		$scope.isEmpty=true;
    		$('#totalCost').css("border-color","red");
    	}
    	else if($scope.checkMoney()==""||$scope.checkMoney()=="Company cover should be smaller than 100,000.00.")
    		$('#totalCost').css("border-color","");
    	if($scope.money2==""){
    		$scope.isEmpty=true;
    		$('#companyCover').css("border-color","red");
    	}
    	else if($scope.checkMoney()=="")
    		$('#companyCover').css("border-color","");
    	if($scope.time1==""){
    		$scope.isEmpty=true;
    		$('#datetimepicker3').css("border-color","red");
    	}
    	else if($scope.checkTime()=="")
    		$('#datetimepicker3').css("border-color","");
    	if($scope.time2==""){
    		$scope.isEmpty=true;
    		$('#datetimepicker4').css("border-color","red");
    	}
    	else if($scope.checkTime()=="")
    		$('#datetimepicker4').css("border-color","");
    	if($scope.period.time==""){
    		$scope.isEmpty=true;
    		$('#setPeriod').css("border-color","red");
    	}
    	else
    		$('#setPeriod').css("border-color","");
    	if($scope.isEmpty)
    		return "The fields with ' * ' cannot be blank.";
    	else
    		return "";
    };
    $scope.showMsg="";
    $scope.isok=false;
    $scope.checkDisplay=function(){
    	$scope.showMsg="";
    	var display="none",msg;
    	if($scope.isok){
    		$scope.showMsg="Your application of the training program already exists";
    		return "block"
    	}
    	msg=$scope.checkIdentification();
    	if(msg!=""){
    		 display="block";
    		 if($scope.showMsg=="")
    			 $scope.showMsg=msg;
    	}
    	msg=$scope.checkMoney();
    	if(msg!=""){
    		display="block";
   		 	if($scope.showMsg=="")
   		 		$scope.showMsg=msg;
    	}
    	msg=$scope.checkTime();
    	if(msg!=""){
    		display="block";
   		 	if($scope.showMsg=="")
   		 		$scope.showMsg=msg;
    	}
    	if($scope.isEmpty){
    		msg=$scope.checkAll();
    		if(msg!=""){
        		display="block";
       		 	if($scope.showMsg=="")
       		 		$scope.showMsg=msg;
        	}
    	}
    	return display;
    }
    $scope.change=function(){
    	$('#trainingProgram').css("border-color","");
    	$scope.isok=false;
    }
    
    
	$scope.saveAsEmployee = function(){
		
    	$('#saveEmp').attr("action","saveapplicationbyemployee");
    	$('#saveEmp').submit();
    };
    
     $scope.saveAsTraffic = function(){
		
    	$('#saveTra').attr("action","saveTrafficbyemployee");
    	$('#saveTra').submit();
    };
    
	$scope.submitAsTraffic = function(){
		$('#saveTra').attr("action","addtrafficbyemployee");
	    $('#saveTra').submit();
				
					

    };
    
    //submit
	$scope.submitAsEmployee = function(){
		$.ajax({
	        type:"POST",
	        url:"checkprogramrepeat?program="+$scope.program,
	        success:function(data){ 
				if(data=='Y'){
					$('#trainingProgram').css("border-color","red");
					$scope.isok=true;
					return;
				}else if(data=='N'){
					$('#saveEmp').attr("action","addapplicationbyemployee");
			    	$('#saveEmp').submit();
				}
					

			},
	        error:function(XMLHttpRequest,textStatus,errorThrown){
			}
	    });
    };
    
    //the reason length
    $scope.left=function() {
    	return 500 - $scope.reason.length;
    };
    
    //get service period from
    $scope.getthedate=function (){
		if($scope.time2!="")
		{	
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
    
    //get service period to
    $scope.gettheMonth=function (){
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
				}
				else{
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
    
    //get all program (add by hacher.yu)
    $http.post("getallprogrambyJson")
    .success(function(data) {
    	$scope.all = data;
    })
    .error(function(){
    });
    
    //set 
    $scope.setApprover=function(v){
    	$scope.approver=v;
    }
    $scope.bingCC = function(){
    	var len = $scope.cc.split(';').length;
    	$scope.ccLast = $scope.cc.split(';')[len-1];
    }
    $scope.setCc=function(v){
    	if(isExit(v))
    		return;
    	var ccs = $scope.cc.split(';');
    	var realCc = '';
    	for(i=0;i<ccs.length-1;i++){
    		realCc = realCc + ccs[i]+';';
    	}
    	$scope.cc= realCc + v + ';';
    	$scope.ccLast = '';
    }
    $scope.setProgram=function(v){
    	$scope.program=v;
    }
    $scope.setPeriod=function(va,ve){
    	$scope.period.time=va;
    	$scope.period.value=ve;
    }
    $scope.getInfo = function() {
		$.ajax( {
			type : "POST",
			
			url : "adminAction_getAllApplication",
			success : function(data) {
				var arr = eval(data);
				$scope.Infomation = arr;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};
	
	$scope.getAppprover = function() {
		$.ajax( {
			type : "POST",
			
			url : "adminAction_getAllApplication1",
			success : function(data) {
				var arr = eval(data);
				$scope.Infomation1 = arr;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};
	
	
}
