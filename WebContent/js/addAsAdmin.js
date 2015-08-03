function addAsAdmin($scope, $http) {
	$scope.applicant = "";
	$scope.empId = "";
	$scope.chineseName = "";
	$scope.idNumber = "";
	$scope.trainingOrgnization = "";
	$scope.program = "";
	$scope.money1 = "";
	$scope.money2 = "";
	$scope.time1 = "";
	$scope.time2 = "";
	$scope.time3 = "";
	$scope.time4 = "";
	$scope.period = {
		time : "",
		value : null
	};
	$scope.periodtype = [ {
		time : "12 months",
		value : 12
	}, {
		time : "6 months",
		value : 6
	} ];
	$scope.status = "";
	$scope.statustype = [ {
		sta : "approved"
	}, {
		sta : "submitted"
	} ];
	$scope.reason = "";
	$scope.program1 = "";

	// check
	$scope.isEmpty=false;
	$scope.isOk=false;
	$scope.checkIsChinese=function(){
		if($scope.chineseName=="")
			return "";
		var reg=/^[\u4E00-\u9FA5]+$/;
		if(reg.test($scope.chineseName)){
			$('#chineseNameAdmin').css("border-color","");
			return "";
		}
		$('#chineseNameAdmin').css("border-color","red");
		return "please fill out the name in Chinese.";
	}
	$scope.checkIdentification=function(){
		for(var i=0;i<$scope.idNumber.length;i++){
			if(i==$scope.idNumber.length-1&&!(($scope.idNumber.charAt(i)>='0'&&$scope.idNumber.charAt(i)<='9')||$scope.idNumber.charAt(i)=='x'||$scope.idNumber.charAt(i)=='X')){
				$('#idNumber').css("border-color","red");
				return "The ID number you typed is incorrect. Please retype your ID number.";
			}
			if(i!=$scope.idNumber.length-1&&!($scope.idNumber.charAt(i)>='0'&&$scope.idNumber.charAt(i)<='9')){
				$('#idNumber').css("border-color","red");
				return "The ID number you typed is incorrect. Please retype your ID number.";
			}
		}
		$('#idNumber').css("border-color","");
		return "";
	}
	$scope.checkIdentificationLength=function(){
		if($scope.idNumber.length==18||$scope.idNumber.length==0){
			$('#idNumber').css("border-color","");
			$scope.isOk=false;
			return "";
		}
		$('#idNumber').css("border-color","red");
		$scope.isOk=true;
		return "The ID number you typed is incorrect. Please retype your ID number.";
	}
	$scope.checkMoney = function() {
		var m2 = $scope.money2;
		var m1 = $scope.money1;
		m2 = m2.replace(/[,]/g, "");
		m1 = m1.replace(/[,]/g, "");
		if (parseFloat(m2) >= 100000) {
			$('#money2').css("border-color", "red");
			return "Company cover should be smaller than 100,000.00."
		} else {
			if (parseFloat(m2) > parseFloat(m1)) {
				$('#money1').css("border-color", "red");
				$('#money2').css("border-color", "red");
				return "Company cover should be smaller than Total cost.";
			} else {
				$('#money1').css("border-color", "");
				$('#money2').css("border-color", "");
				return "";
			}
		}
	};
	$scope.checkTime = function() {
		var dtArr1 = $scope.time1.split("-");
		var dtArr2 = $scope.time2.split("-");
		var dt1 = new Date(dtArr1[0], dtArr1[1], dtArr1[2]);
		var dt2 = new Date(dtArr2[0], dtArr2[1], dtArr2[2]);
		if (dt1 > dt2) {
			$('#datetimepicker1').css("border-color", "red");
			$('#datetimepicker2').css("border-color", "red");
			return "End training period should be later than begin training period."
		} else {
			$('#datetimepicker1').css("border-color", "");
			$('#datetimepicker2').css("border-color", "");
			return "";
		}
	};
	$scope.checkTrainingProgram = function() {
		if ($scope.program != "") {
			$scope.getProgram();
			var temp = $scope.program1.length;
			for ( var i = 0; i < temp; i++) {
				if ($scope.program1[i].programName == $scope.program) {
					$('#trainingProgram_admin').css("border-color", "");
					return "";
				}
			}
			;
			$('#trainingProgram_admin').css("border-color", "red");
			return "Training program " + $scope.program + " is not found!";
		}
		return "";
	};
	$scope.checkAll = function() {
		$scope.isEmpty = false;
		if ($scope.applicant == "") {
			$scope.isEmpty = true;
			$('#applicant').css("border-color", "red");
		} else
			$('#applicant').css("border-color", "");
		if ($scope.applicant == "") {
			$scope.isEmpty = true;
			$('#empId').css("border-color", "red");
		} else
			$('#empId').css("border-color", "");
		if ($scope.chineseName == "") {
			$scope.isEmpty = true;
			$('#chineseNameAdmin').css("border-color", "red");
		} else if ($scope.checkIsChinese() == "")
			$('#chineseNameAdmin').css("border-color", "");
		if ($scope.idNumber == "") {
			$scope.isEmpty = true;
			$('#idNumber').css("border-color", "red");
		} else if ($scope.checkIdentification() == "")
			$('#idNumber').css("border-color", "");
		if ($scope.trainingOrgnization == "") {
			$scope.isEmpty = true;
			$('#trainingOrgnization').css("border-color", "red");
		} else
			$('#trainingOrgnization').css("border-color", "");
		if ($scope.program == "") {
			$scope.isEmpty = true;
			$('#trainingProgram_admin').css("border-color", "red");
		} else
			$('#trainingProgram_admin').css("border-color", "");
		if ($scope.money1 == "") {
			$scope.isEmpty = true;
			$('#money1').css("border-color", "red");
		} else if ($scope.checkMoney() == ""
				|| $scope.checkMoney() == "Company cover should be smaller than 100,000.00.")
			$('#money1').css("border-color", "");
		if ($scope.money2 == "") {
			$scope.isEmpty = true;
			$('#money2').css("border-color", "red");
		} else if ($scope.checkMoney() == "")
			$('#money2').css("border-color", "");
		if ($scope.time1 == "") {
			$scope.isEmpty = true;
			$('#datetimepicker1').css("border-color", "red");
		} else if ($scope.checkTime() == "")
			$('#datetimepicker1').css("border-color", "");
		if ($scope.time2 == "") {
			$scope.isEmpty = true;
			$('#datetimepicker2').css("border-color", "red");
		} else if ($scope.checkTime() == "")
			$('#datetimepicker2').css("border-color", "");
		if ($scope.period.time == "") {
			$scope.isEmpty = true;
			$('#period').css("border-color", "red");
		} else
			$('#period').css("border-color", "");
		if ($scope.status == "") {
			$scope.isEmpty = true;
			$('#status').css("border-color", "red");
		} else
			$('#status').css("border-color", "");
		if ($scope.isEmpty)
			return "The fields with ' * ' cannot be blank.";
		else
			return "";
	};
	$scope.showMsg="";
    $scope.checkDisplay=function(){
    	$scope.showMsg="";
    	var display="none",msg;
    	msg=$scope.checkIsChinese();
    	if(msg!=""){
    		 display="block";
    		 if($scope.showMsg=="")
    			 $scope.showMsg=msg;
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
    	if($scope.isOk){
    		msg=$scope.checkIdentificationLength();
    		if(msg!=""){
        		display="block";
       		 	if($scope.showMsg=="")
       		 		$scope.showMsg=msg;
        	}
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

	// save
	$scope.saveAsAdmin = function() {
		$('#saveAdmin').attr("action", "adminAction_saveByAdmin");
		$('#saveAdmin').submit();
	};

	// submit
	$scope.submitAsAdmin = function() {
		var ok=true;
		if($scope.checkIsChinese()!="")
			ok=false;
		if($scope.checkIdentification()!="")
			ok=false;
		if($scope.checkIdentificationLength()!="")
			ok=false;
		if($scope.checkMoney()!="")
			ok=false;
		if($scope.checkTime()!="")
			ok=false;
		if($scope.checkAll()!="")
			ok=false;
		if(!ok)
			return;
		$('#saveAdmin').attr("action", "adminAction_submit");
		$('#saveAdmin').submit();
	};

	// set
	$scope.setapplicant = function(va) {
		$scope.applicant = va;
		$scope.getId();
	};
	$scope.setempId = function(va) {
		$scope.empId = va;
		$scope.getName();
	};
	$scope.setProgram = function(va) {
		$scope.program = va;
	};
	$scope.setPeriod = function(va, ve) {
		$scope.period.time = va;
		$scope.period.value = ve;
	};
	$scope.setStatus = function(ve) {
		$scope.status = ve;
	};

	// get
	function toObject(a) {
		return (new Function('return ' + a))();
	}
	;
	function toObject1(a) {
		return (new Function('return ' + a))();
	}
	;
	$scope.getName = function() {
		$.ajax( {
			type : "POST",
			url : "adminAction_showName?selectedid=" + $scope.empId,
			dataType : 'text',
			success : function(data) {
				$('#applicant').val(data);
				$scope.applicant = data;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};
	$scope.getId = function() {
		$.ajax( {
			type : "POST",
			url : "adminAction_showId?selectedname=" + $scope.applicant,
			dataType : 'text',
			success : function(data) {
				$('#empId').val(data);
				$scope.empId = data;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};
	$scope.getProgram = function() {
		$.ajax( {
			type : "POST",
			url : "showIdAction_getprogram?selectedname=" + $scope.applicant,
			success : function(data) {
				var arr = toObject(data);
				$scope.program1 = arr;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};
	$scope.getInfo = function() {
		$.ajax( {
			type : "POST",
			url : "adminAction_getAllApplication",
			success : function(data) {
				var arr = toObject1(data);
				$scope.Infomation = arr;
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
	};

	// the reason length
	$scope.left = function() {
		return 500 - $scope.reason.length;
	};

	// get service period from
	$scope.getthedate = function() {
		// alert("time2="+$scope.time2);
		if ($scope.time2 != "") {
			var a = new Date($scope.time2);
			a = a.valueOf();
			a = a + 1 * 24 * 60 * 60 * 1000;
			a = new Date(a);
			var m = a.getMonth() + 1;
			if (m.toString().length == 1) {
				m = '0' + m;
			}
			var d = a.getDate();
			if (d.toString().length == 1) {
				d = '0' + d;
			}
			$scope.time3 = a.getFullYear() + "-" + m + "-" + d;
			return $scope.time3;
		}
	};

	// get service period to
	$scope.gettheMonth = function() {
		if ($scope.time3 != ''
				&& ($scope.period.value == 12 || $scope.period.value == 6)) {
			var ti = $scope.time2.split("-");
			var year = parseInt(ti[0]);
			var month = parseInt(ti[1]);
			var day = parseInt(ti[2]);
			if (parseInt($scope.period.value) == 12) {
				year = year + 1;
			}
			if (parseInt($scope.period.value) == 6) {
				if (month > 6) {
					year = year + 1;
					month = month + 6 - 12;
				} else {
					month = month + 6;
				}
			}
			if (month == 2 && day == 29) {
				day--;
			}
			if (month < 10) {
				month = "0" + month;
			}
			if (day < 10) {
				day = "0" + day;
			}
			$scope.time4 = year + "-" + month + "-" + day;
			return $scope.time4;
		}
	};
	$scope.setCc = function(va) {
		if (isExit(va))
			return;
		else
			$scope.cc = $scope.cc + va + ";";
	};
	$scope.setApprover = function(va) {
		$scope.approver = va;
	};

	$scope.setProgram = function(va) {
		$scope.program = va;
	};

};