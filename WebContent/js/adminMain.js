$('#shclKeyframes').shCircleLoader({keyframes:"0%{background:black}40%{background:transparent}60%{background:transparent}100%{background:black}"});

function adminMain($scope,$http){
	//filter
	$scope.myfilter={
			empIdFilter:"",
			empNameFilter:"",
			trainingProgramFilter:"",
			totalCostFilter:"",
			companyCoverFilter:"",
			servicePeriodFromFilter:"",
			servicePeriodToFilter:"",
			statusFilter:""
	};
	
	
	
	//get all applications by status
	$scope.applications;
    $.ajax({
        type:"POST",
        async:false,
        url:"adminAction_getAllApplicationByStatus",
        beforeSend:function(){ 
			$('#shclKeyframes').show();
		},
        success:function(data){ 
			$scope.applications = eval(data); 
			setTimeout(function(){$('#shclKeyframes').hide();},1000);
		},
        error:function(XMLHttpRequest,textStatus,errorThrown){
		}
    });
    
    $scope.refresh = function(){
    	$scope.moveTheDiv('admindetail');
    	$scope.initBeforeRef();
    	$('#shclKeyframes').show();
    	$('#tbodyadmin').css('display','none');
		$.ajax( {
			type : "POST",
			async : false,
			url : "adminAction_getAllApplicationByStatus",
			beforeSend : function() {
				$('#shclKeyframes').show();
			},
			success : function(data) {
				
				$scope.applications = eval(data);
				
				setTimeout(function() {
					$('#tbodyadmin').css('display','block');
					$('#shclKeyframes').hide();
				}, 1000);
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
			}
		});
		
	}
    //show detail 
	$scope.now=null;
	$scope.selapplication;
	$scope.showdetailtobox=function(ve){
    	for(var i=0;i<$scope.applications.length;i++){
    		if($scope.applications[i].dataId==ve){
    			$scope.selapplication = $scope.applications[i];
    			return;
    		}
    	}
    };
    
    $scope.focusme = function (ve){
    	
    	$('#tbodyadmin').find('tr').not(document.getElementById($scope.now)).css('background','');
		$(document.getElementById(ve + ',')).css('background','#E1E7EC');
		};
	
	
  $scope.commentsByAdmin = function(dataId){
    	if($scope.comments=="")
    		return;
    	var url;
    	url =  "adminaddcomments?dataid="+dataId+"&comments="+$scope.comments;
    	$.ajax({
	        type: "POST",
	        async:false,
	        url: url,
	        success: function(data){
	        	$scope.selapplication.commented = '1';
	        	$scope.selapplication.comments = $scope.comments;
	        	$scope.moveTheComment();
	        	
	        },
	        error:function(XMLHttpRequest, textStatus, errorThrown){
	     }
	    });
    }
    
    
    
    $scope.showComments = function(){ 	 	
	        $scope.myVar = !$scope.myVar;	 	    
	    if($scope.myVar){
	    	$("#commentsDiv").css("display","none");
	    }else{
	    	$("#commentsDiv").css("display","block");
	    }
}
    $scope.showdetail=function(ve){
    	$scope.comments = "";
    	$('#commentsDiv').css('display','none');
    	$('#tbody3').html('');
    	if($scope.now==null){
    		$scope.showdetailtobox(ve);
    		$(document.getElementById(ve+",")).after($("#admindetail"));   
    		$(document.getElementById(ve+",")).css("background-color","#E1E7EC");
         	$("#admindetail").show(500);
         	setTimeout($scope.movetosuitable(ve + ','),600);
         	$scope.now = ve+",";
    	}else if($scope.now==ve+","){
    		$("#admindetail").hide(500);
    		$('#bb').css('display','none');
    		$(document.getElementById(ve+",")).css("background-color","");
    		$scope.now=null;
    	}else if($scope.now!=ve+","){
    		$("#admindetail").css("display","none");
    		$("#commentsDiv").css("display","none");
    		$("#admindetail").hide(500);
    		$('#bb').css('display','none');
    		$(document.getElementById($scope.now)).css("background-color","");
         	$scope.now=ve+",";
    		$scope.showdetailtobox(ve);
    		$(document.getElementById(ve+",")).after($("#admindetail")); 
    		$(document.getElementById(ve+",")).css("background-color","#E1E7EC");
         	$("#admindetail").show(500);
         	setTimeout($scope.movetosuitable($scope.now),600);
    	}
    };
    
    $scope.movetosuitable = function(ve){
		var allheight = $('#tbodyadmin').offset().top + $('#tbodyadmin').height();
		var lineheight = $(document.getElementById(ve)).offset().top + $(document.getElementById(ve+",")).height();	
		var detailheight = 380;
		if(detailheight + lineheight> allheight){
			var move = detailheight + lineheight - allheight;
			$('#tbodyadmin').animate({scrollTop:'+=' + move + 'px'},500);
		}
	};
	
	//select all
	$scope.isSelectAll=false;
	$scope.selectAll=function(){
		$scope.isSelectAll=!$scope.isSelectAll;
		var checkboxs=document.getElementsByName("choose");
		for(var i=0;i<checkboxs.length;i++){
			var e=checkboxs[i];
			if($scope.isSelectAll)
				e.checked=true;
			else
				e.checked=false;
		}
	};
	
	//export exel
	$scope.exportexel=function(){
		var str="";
        $("input:checked").each(function(){
        	if($(this)[0].id=="allChecked")
            	return;
        	str+=$(this)[0].id;
        });
        if(str=="")
        	return;
        var p="?informationId="+str;
        $.ajax({
        	type:"POST",
        	async:false,
        	url:"export.action"+p,
        	dataType:'text',
        	success:function(data){
        		$('#trs').html(data);
        		method1("test");
        	}
        });
	};
	

    
    $scope.begindelete = function(dataId,status){
    	if(status == "unsubmit"){
    		$('#deleteWarnadmin').slideToggle();
    		$('#deldataid').val(dataId); 
    	} 
   };
   
   $scope.begindelete = function(dataId, status) {
		if (status == "unsubmit") {
			$('#deleteWarnadmin').slideToggle();
			$('#deldataid').val(dataId);
		}
	};


	$scope.comments="";
	$scope.myVar=false;
	$scope.applicant="";
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
	 $scope.setComments = function(va){
			$scope.comments = va;
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
	$scope.left2 = function() {
		return 200 - $scope.comments.length;
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
	

	$scope.beginedit = function(status) {
		document.getElementById("bar").innerHTML="Edit";
		if (status != "unsubmit" && status != "disapproved")
			return;
		$scope.newapplications = $scope.selapplication;
		$scope.select();
		$("#admineditpage").css("display", "block");
		$('#selecttab').children().removeClass('active');
		$("#admineditpage").addClass('active');

		$('.agreementview').css("display", "none");
		$('#admineditform').css("display", "block");
	};
	
	$scope.select = function() {
		if ($scope.newapplications.chineseName != null) {
			$scope.chineseName = $scope.newapplications.chineseName;
		}
		if ($scope.newapplications.identification != null) {
			$scope.idNumber = $scope.newapplications.identification;
		}
		if ($scope.newapplications.trainingInstitution != null) {
			$scope.trainingOrgnization = $scope.newapplications.trainingInstitution;
		}
		if ($scope.newapplications.empName != null) {
			$scope.applicant = $scope.newapplications.empName;
		}
		if ($scope.newapplications.empId != null) {
			$scope.empId = $scope.newapplications.empId;
		}
		if ($scope.newapplications.trainingProgram != null) {
			$scope.program = $scope.newapplications.trainingProgram;
		}
		if ($scope.newapplications.cc != null) {
			$scope.cc = $scope.newapplications.cc;
		}
		if ($scope.newapplications.approver != null) {
			$scope.approver = $scope.newapplications.approver;
		}
		if ($scope.newapplications.totalCost != null) {
			$scope.money1 = $scope.newapplications.totalCost;
		}
		if ($scope.newapplications.companyCover != null) {
			$scope.money2 = $scope.newapplications.companyCover;
		}
		if ($scope.newapplications.trainingPeriodFrom != null) {
			$scope.time1 = $scope.newapplications.trainingPeriodFrom;
		}
		if ($scope.newapplications.trainingPeriodTo != null) {
			$scope.time2 = $scope.newapplications.trainingPeriodTo;
		}
		if ($scope.newapplications.setPeriod != null) {
			$scope.period.time = $scope.newapplications.setPeriod;
			if ($scope.period.time == "6 months") {
				$scope.period.value = 6;
			} else if ($scope.period.time == "12 months") {
				$scope.period.value = 12;
			}
		}
		if ($scope.newapplications.status != null) {
			if ($scope.newapplications.status == "unsubmit") {
				$scope.status = "";
			} else {
				$scope.status = $scope.newapplications.status;
			}
		}
		if ($scope.newapplications.reason != null) {
			$scope.reason = $scope.newapplications.reason;
		}
	};
	
	$scope.moveTheDiv = function(divId){
	   	 $('#'+divId).hide(500);
		 $('#'+divId).css("display","none");
		 $(document.getElementById('count1')).after($('#'+divId));
	   }
	
	$scope.moveTheComment = function(){
		$scope.comments = "";
    	$('#commentsDiv').hide(500);
    	$('#tbody3').html('');
	}
	
	$scope.initBeforeRef = function(){
		$(':checkbox')[0].checked = false;
		$scope.myfilter.empIdFilter = "";
		$scope.myfilter.empNameFilter = "";
    	$scope.myfilter.trainingProgramFilter = "";
    	$scope.myfilter.totalCostFilter = "";
    	$scope.myfilter.companyCoverFilter = "";
    	$scope.myfilter.servicePeriodFromFilter = "";
    	$scope.myfilter.servicePeriodToFilter = "";
    	$scope.myfilter.statusFilter = "";
    }
}
